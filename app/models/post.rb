class Post < ApplicationRecord
    VALID_AD_TITLE_REGEX = /\A[\w\d]+[\s]?{1}[\w\d]+\z/i.freeze

    belongs_to :user, optional: true
    belongs_to :category

    has_many :post_attachments
    accepts_nested_attributes_for :post_attachments

    validates :ad_title, presence: true, length: {maximum: 16, minimum: 2}, format: {with: VALID_AD_TITLE_REGEX}
    validates :detailed_ad_title, presence: true, length: {maximum: 30, minimum: 2}
    validates :ad_description, presence: true, length: {maximum: 255, minimum: 2}
    validates :user_name, presence: true, length: {maximum: 30, minimum: 2}
    validates :phone, presence: true, length: {maximum: 15, minimum: 10}
    validates :city, presence: true, length: {maximum: 50, minimum: 1}
    
    
end
