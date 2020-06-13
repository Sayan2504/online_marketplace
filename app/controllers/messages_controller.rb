class MessagesController < ApplicationController
  include NotificationsHelper
  before_action :set_notifications
  
  def create
    @message = Message.new(message_params)
    @message.user = current_user 
    @message.post = Post.find(@message.post_id)
    @message.receiver_id = User.find(@message.receiver_id).id
    @message.save
  end

  def new
    @receiver = User.find(params[:receiver_id]) 
    @post = Post.find(params[:post_id])
    @messages = Message.receiver_side(current_user.id, @receiver.id).or (Message.sender_side(current_user.id, @receiver.id)) 
    @messages = @messages.message_post_id(@post.id)
    @messages = @messages.order("created_at ASC").includes(:user)
    @message = Message.new
  end

  private
 
  def message_params
    params.require(:message).permit(:body, :post_id, :receiver_id)
  end

  def set_notifications
    @notifications = Notification.all.reverse
  end 
end
