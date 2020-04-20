class MessagesController < ApplicationController
  include NotificationsHelper
  before_action :set_notifications
  

  def index
  end

  def new
    #showing the chat thread
    @receiver = User.find(params[:receiver_id]) 
    @post = Post.find(params[:post_id])

    #Individual chat room created based on user and post
    @messages = Message.where(receiver_id: current_user.id, user_id: @receiver.id).or (Message.where(user_id: current_user.id, receiver_id: @receiver.id)) 
    @messages = @messages.where(post_id: @post.id)
    @messages = @messages.order("created_at ASC") #chats ordered based on time of creation
   

    #getting the params to be used during create
    @message = Message.new  #rendering a new message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user #populating the user_id field in messages table

    #populating the post_id field in messages table 
    @message.post = Post.find_by(id: @message.post_id)

    #populating the receiver_id field in messages table 
    @message.receiver_id = User.find(@message.receiver_id).id

    #saving based on params received from form
    @message.save
      
    
  end


  private
 
  def set_notifications
    @notifications = Notification.all.reverse
  end 
  
  def message_params
    params.require(:message).permit(:body, :post_id, :receiver_id)
  end
end
