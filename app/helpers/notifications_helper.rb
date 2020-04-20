module NotificationsHelper
    def notification_view
        Notification.where.not(sender_id: current_user.id).reverse
    end
end
