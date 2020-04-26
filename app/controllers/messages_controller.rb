class MessagesController < ApplicationController
  include NotificationsHelper
  before_action :set_notifications
  
  def create
    @message = Message.new(message_params)
    @message.user = current_user #populating the user_id field in messages table

    #populating the post_id field in messages table 
    @message.post = Post.find(@message.post_id)

    #populating the receiver_id field in messages table 
    @message.receiver_id = User.find(@message.receiver_id).id

    #saving based on params received from form
    @message.save
  end

  def new
    #showing the chat thread
    @receiver = User.find(params[:receiver_id]) 
    @post = Post.find(params[:post_id])

    #Individual chat room created based on user and post
    @messages = Message.receiver_side(current_user.id, @receiver.id).or (Message.sender_side(current_user.id, @receiver.id)) 
    @messages = @messages.message_post_id(@post.id)
    @messages = @messages.order_messages.includes(:user) #chats ordered based on time of creation
   
    #getting the params to be used during create
    @message = Message.new  #rendering a new message
  end

  private
 
  def message_params
    params.require(:message).permit(:body, :post_id, :receiver_id)
  end

  def set_notifications
    @notifications = Notification.all.reverse
  end 
end
