class Message < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  after_create_commit{
    MessageBroadcastJob.perform_later(self)
  }
end
