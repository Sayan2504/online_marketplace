class NotificationsController < ApplicationController
  include NotificationsHelper

  def index
    @notifications = notification_view
  end

  def read_message
    @sender_id = User.find(params[:sender_id])
    @receiver_id = User.find(params[:receiver_id])
    @post_id = Post.find_post_id(params[:post_id])

    @notification = Notification.find(params[:id])

    if params[:decision] == "true"
      if @notification.unread == "true"
        @notification.update(unread: "false")
        redirect_to new_message_path({ post_id: @post_id.id, sender_id: @receiver_id.id, receiver_id: @sender_id.id })
      end
    end
  end
  
end




