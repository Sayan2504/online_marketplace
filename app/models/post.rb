class Post < ApplicationRecord
  VALID_AD_REGEX = /\A[\w\d]+[\s\d\w()]*\z/i.freeze
  VALID_USERNAME_REGEX = /\A[\w\d]+[\w\d\s_]*\z/i.freeze
  VALID_PHONE_REGEX = /\A[1-9]{0,3}-[6-9]{1}[0-9]{9}\z/i.freeze
  VALID_CITY_REGEX = /\A[A-Za-z]{1}[\sA-Za-z]*\z/i.freeze

  belongs_to :user
  belongs_to :category

  has_many :post_attachments
  has_many :reviews
  has_many :messages
  has_and_belongs_to_many :buyers

  accepts_nested_attributes_for :post_attachments

  validates :ad_title,  presence: true, length: { maximum: 16, minimum: 2 }, format: { with: VALID_AD_REGEX }
  validates :detailed_ad_title,  presence: true, length: { maximum: 30, minimum: 2 }, format: { with: VALID_AD_REGEX }
  validates :ad_description,  presence: true, length: { maximum: 255, minimum: 2 }
  validates :user_name, presence: true, length: { maximum: 30, minimum: 2 }, format: { with: VALID_USERNAME_REGEX }
  validates :phone, presence: true, length: { maximum: 15, minimum: 10 }, format: { with: VALID_PHONE_REGEX }
  validates :city,  presence: true, length: { maximum: 50, minimum: 1 }, format: { with: VALID_CITY_REGEX }
  validates :user_id, presence: true

  
  scope :admin_post_approval, ->(value) { update(approved_by: value) }
  scope :admin_post_state, ->(state) { where(approved_by: state) }
  scope :admin_post_approved_state, -> { where.not(approved_by: ['null', 'rejected']) }
  scope :post_category, ->(category) { where(category_id: category) }
  scope :post_unsold, -> { where(buyer_id: nil) }
  scope :post_ad_title, ->(title) { where("ad_title LIKE ?", "%#{ title }%") }
  scope :post_city, ->(name) { where("city LIKE ?", "#{ name }%") }
  scope :product_bought_sold, ->(product_id) { where(buyer_id: product_id) }
  scope :update_buyer, ->(value) { update(buyer_id: value) }
  scope :where_post_id, ->(id) { where(id: id) }
end
