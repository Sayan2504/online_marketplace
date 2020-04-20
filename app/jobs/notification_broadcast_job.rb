class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, sender)
    get_counter = Notification.where(receiver_id: message.receiver_id, unread: "true")
    
    counter = get_counter.count

    sender = User.find(message.user_id)
    post = Post.find(message.post_id)

    body = "[" + DateTime.parse(message.created_at.to_s).strftime("%a %I:%M %p") + "] New Message from #{sender.name} for the post #{post.ad_title}"

    ActionCable.server.broadcast "notification_channel_#{message.receiver_id}", counter: counter, body: body
  end
end
