class MessagesController < ApplicationController
  
  def new
    #showing the chat thread
    @messages = Message.where(user_id: params[:sender_id]) #filtering based on the sender for a particular message in chat
    @messages = @messages.where(post_id: params[:post_id]) #filtering based on the post for a particular message in chat

    #getting the params to be used during create
    @post = Post.find(params[:post_id]) #finding the post based on url params

    @message = Message.new  #rendering a new message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user #populating the user_id field in messages table

    #populating the post_id field in messages table
    @posts_current_user = current_user.posts
    @posts_current_user = @posts_current_user.find_by(id: @message.post_id)
    @message.post = @posts_current_user

    #saving based on params received from form
    @message.save
    
  end


  private

  def message_params
    params.require(:message).permit(:body, :post_id)
  end
end
