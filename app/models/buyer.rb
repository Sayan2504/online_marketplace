class Buyer < ApplicationRecord
    has_and_belongs_to_many :posts
    belongs_to :user
end
