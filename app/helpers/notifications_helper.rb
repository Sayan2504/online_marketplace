module NotificationsHelper
  def notification_view
    if params[:post_id].present?
      Notification.where(receiver_id: current_user.id, post_id: params[:post_id], unread: "true").reverse  
    else  
      Notification.where(receiver_id: current_user.id, unread: "true").reverse
    end  
  end
end
