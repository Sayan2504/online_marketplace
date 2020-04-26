class Review < ApplicationRecord
  belongs_to :post

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAME_AND_LOCATION_REGEX = /\A[A-Za-z]{1}[\sA-Za-z]*\z/i.freeze

  after_validation { self.email = self.email.downcase }
  after_validation { self.name = self.name.squish }
  after_validation { self.location = self.location.squish }

  validates :name,  presence: true, length: { maximum: 30, minimum: 2 }, format: { with: VALID_NAME_AND_LOCATION_REGEX }
  validates :email, presence: true, length: { maximum: 40, minimum: 2 }, format: { with: VALID_EMAIL_REGEX }
  validates :location, presence: true, length: { maximum: 30, minimum: 2 }, format: { with: VALID_NAME_AND_LOCATION_REGEX }
  validates :review, presence: true, length: { minimum: 1 }
  validates :rating, presence: true
  validates :post_id, presence: true

  scope :admin_review_approval, ->(value) { update(approved_by: value) }
end
