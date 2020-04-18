class MessagesController < ApplicationController

  def new
    #@messages = Message.all
    #showing the chat thread
    @receiver = User.find(params[:receiver_id])
    @messages = Message.where(receiver_id: current_user.id, user_id: @receiver.id).or (Message.where(user_id: current_user.id, receiver_id: @receiver.id)) #filtering based on the post for a particular message in chat

    @messages = @messages.order("created_at ASC")
    #@messages = @messages.where(receiver_id: params[:receiver_id])

    #getting the params to be used during create
    #@post = Post.find(params[:post_id]) #finding the post based on url params
    @message = Message.new  #rendering a new message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user #populating the user_id field in messages table

    #populating the post_id field in messages table 
    @message.post = Post.find_by(id: @message.post_id)
    @message.receiver_id = User.find(@message.receiver_id).id
    #@message.receiver_id = params[:receiver_id
    #saving based on params received from form
    @message.save
  end


  private

  
  def message_params
    params.require(:message).permit(:body, :post_id, :receiver_id)
  end
end
