class Buyer < ApplicationRecord
  has_and_belongs_to_many :posts
  belongs_to :user, optional: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAME_AND_LOCATION_REGEX = /\A[A-Za-z]{1}[\sA-Za-z]*\z/i.freeze

  after_validation { self.email = self.email.downcase }
  after_validation { self.buyer_name = self.buyer_name.squish }
  after_validation { self.location = self.location.squish }

  validates :buyer_name, presence: true, length: { maximum: 30, minimum: 2 }, format: { with: VALID_NAME_AND_LOCATION_REGEX }
  validates :email, presence: true, length: { maximum: 40, minimum: 2 }, format: { with: VALID_EMAIL_REGEX }
  validates :location, presence: true, length: { maximum: 30, minimum: 2 }, format: { with: VALID_NAME_AND_LOCATION_REGEX }
  validates :post_id, presence: true, length: { maximum: 10, minimum: 1 }
  validates :user_id, presence: true, length: { maximum: 10, minimum: 1 }

  scope :buyer_email, ->(email_id) { where(email: email_id) }
  scope :buyer_post_id, ->(value) { where(post_id: value) }
  scope :buyer_user_id, ->(value) { where(user_id: value) }
end
