class Notification < ApplicationRecord
  validates :body,  presence: true, length: { minimum: 1 }
  validates :post_id, presence: true
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
end
