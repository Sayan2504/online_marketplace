class Post < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :category

    has_many :post_attachments
    accepts_nested_attributes_for :post_attachments
end
