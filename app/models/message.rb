class Message < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit{
    MessageBroadcastJob.perform_later(self)

    sender = User.find(self.user_id)
    post = Post.find(self.post_id)
    receiver = User.find(self.receiver_id)

    body = "[" + DateTime.parse(created_at.to_s).strftime("%a %I:%M %p") + "] New Message from #{sender.name} for the post #{post.ad_title}"

    Notification.create(sender_id: user_id, receiver_id: receiver_id, post_id: post_id, body: body)
    NotificationBroadcastJob.perform_later(self, sender)
  }
end
