class Category < ApplicationRecord
  VALID_CATEGORY_REGEX = /\A[\sA-Za-z]*\z/i.freeze

  has_many :posts

  after_validation { self.name = self.name.squish }

  validates :name,  presence: true, length: { maximum: 14, minimum: 2 } , uniqueness: { case_sensitive: false }, format: { with: VALID_CATEGORY_REGEX }
end
