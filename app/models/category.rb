class Category < ApplicationRecord
  VALID_CATEGORY_REGEX = /\A[A-Za-z]{1}[\sA-Za-z]*\z/i.freeze

  has_and_belongs_to_many :users
  has_many :posts

  validates :name,  presence: true, length: { maximum: 14, minimum: 2 } , uniqueness: { case_sensitive: false }, format: { with: VALID_CATEGORY_REGEX }
end
