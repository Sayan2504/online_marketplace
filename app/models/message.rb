class Message < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit{
    MessageBroadcastJob.perform_later(self)
    Message.create(event: "New Notification")
  }
end
