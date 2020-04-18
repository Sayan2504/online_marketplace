class MessagesController < ApplicationController

  def new
    @messages = Message.all
    #showing the chat thread
    #@messages = Message.where(post_id: params[:post_id]) #filtering based on the post for a particular message in chat
    #@messages = @messages.where(receiver_id: params[:receiver_id])

    #getting the params to be used during create
    @post = Post.find(params[:post_id]) #finding the post based on url params
    #@receiver = User.find(params[:receiver_id])
    @message = Message.new  #rendering a new message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user #populating the user_id field in messages table

    #populating the post_id field in messages table 
    @message.post = Post.find_by(id: @message.post_id)
    @message.receiver_id = params[:receiver_id]
    #@message.receiver_id = receiver_id
    #saving based on params received from form
    @message.save
  end


  private

  
  def message_params
    params.require(:message).permit(:body, :post_id, :receiver_id)
  end
end
