class Post < ApplicationRecord
    VALID_TITLE_REGEX = /\A[\w\d]+[\s\d\w+]*\z/i.freeze
    VALID_USERNAME_REGEX = /\A[\w\d]+[\w\d\s_]*\z/i.freeze
    VALID_PHONE_REGEX = /\A[1-9]{0,3}-[6-9]{1}[0-9]{9}\z/i.freeze
    VALID_CITY_REGEX = /\A[\w]+[\s\w]*\z/i.freeze

    
    belongs_to :user, optional: true
    belongs_to :category

    has_many :post_attachments
    has_many :reviews
    accepts_nested_attributes_for :post_attachments

    validates :ad_title, presence: true, 
                         length: {maximum: 16, minimum: 2}, 
                         format: {with: VALID_TITLE_REGEX}

    validates :detailed_ad_title, presence: true, 
                                  length: {maximum: 30, minimum: 2},
                                  format: {with: VALID_TITLE_REGEX}

    validates :ad_description, presence: true, 
                               length: {maximum: 255, minimum: 2},
                               format: {with: VALID_TITLE_REGEX}

    validates :user_name, presence: true, 
                          length: {maximum: 30, minimum: 2},
                          format: {with: VALID_USERNAME_REGEX}

    validates :phone, presence: true, 
                      length: {maximum: 15, minimum: 10},
                      format: {with: VALID_PHONE_REGEX}

    validates :city, presence: true, 
                     length: {maximum: 50, minimum: 1},
                     format: {with: VALID_CITY_REGEX}   
end
