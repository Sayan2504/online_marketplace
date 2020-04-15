class MessagesController < ApplicationController
  def index
  end

  def show
    @messages = Message.all
    @message = Message.new
  end
end
