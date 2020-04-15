class MessagesController < ApplicationController
  
  def new
    @messages = Message.where(user_id: params[:sender_id])
    @messages = @messages.where(post_id: params[:post_id])

    @post = Post.find(params[:post_id])

    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    @posts_current_user = current_user.posts
    @posts_current_user = @posts_current_user.find_by(id: @message.post_id)
    @message.post = @posts_current_user

    #@message.post = current_user.posts.find_by!(id: params[:post_id])
    @message.save
    
  end


  private

  def message_params
    params.require(:message).permit(:body, :post_id)
  end
end
