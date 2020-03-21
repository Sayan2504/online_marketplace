class Category < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :posts

    validates :name, presence: true, length: {maximum: 30, minimum: 2}
end
