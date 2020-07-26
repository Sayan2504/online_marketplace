class NotificationsController < ApplicationController
  include NotificationsHelper

  def index
    if logged_in?
      @notifications = notification_view
    else
      redirect_to "/logged_out.html"
    end
  end

  def read_message
    @sender_id = User.find(params[:sender_id])
    @receiver_id = User.find(params[:receiver_id])
    @post_id = Post.find(params[:post_id])
    @notification = Notification.find(params[:id])
    if params[:decision] == "true"
      if @notification.unread == "true"
        @notification.update(unread: "false")
        redirect_to new_message_path( { post_id: @post_id.id, sender_id: @receiver_id.id, receiver_id: @sender_id.id } )
      end
    end
  end
end




