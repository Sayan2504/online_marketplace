module NotificationsHelper
  def notification_view
    Notification.where(receiver_id: current_user.id, unread: "true").reverse
  end
end
