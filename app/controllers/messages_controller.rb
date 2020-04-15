class MessagesController < ApplicationController
  
  def new
    @messages = Message.where(user_id: params[:sender_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    
  end


  private

  def message_params
    params.require(:message).permit(:body)
  end
end
