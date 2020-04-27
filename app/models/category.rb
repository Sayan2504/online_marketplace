class Category < ApplicationRecord
  VALID_CATEGORY_REGEX = /\A[A-Za-z]{1}[\sA-Za-z]*\z/i.freeze

  has_and_belongs_to_many :users
  has_many :posts

  validates :name,  presence: true, length: { maximum: 30, minimum: 2 } , format: { with: VALID_CATEGORY_REGEX }
end
