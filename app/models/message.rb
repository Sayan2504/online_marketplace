class Message < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :sender_side, ->(sender_id, receiver_id) { where(user_id: sender_id, receiver_id: receiver_id) }
  scope :receiver_side, ->(sender_id, receiver_id) { where(receiver_id: sender_id, user_id: receiver_id) }
  scope :message_post_id, ->(value) { where(post_id: value) }

  after_validation { self.body = self.body.squish }

  validates :body,  presence: true, length: { minimum: 1 }
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :receiver_id, presence: true

  def self.order_messages
    order("created_at ASC")
  end

  after_create_commit {
    MessageBroadcastJob.perform_later(self)
    sender = User.find(self.user_id)
    post = Post.find(self.post_id)
    receiver = User.find(self.receiver_id)
    body = "[" + DateTime.parse(created_at.to_s).strftime("%a %I:%M %p") + "] New Message from #{sender.name} for the post #{post.ad_title}"
    Notification.create(sender_id: user_id, receiver_id: receiver_id, post_id: post_id, body: body)
    NotificationBroadcastJob.perform_later(self, sender)
  }
end
