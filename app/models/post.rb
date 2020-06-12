class Post < ApplicationRecord
  VALID_AD_REGEX = /\A[\s\w\d]+[\s\d\w()]*\z/i.freeze
  VALID_USERNAME_REGEX = /\A[\s\w\d]+[\w\d\s_]*\z/i.freeze
  VALID_PHONE_REGEX = /\A[1-9]{0,3}-[6-9]{1}[0-9]{9}\z/i.freeze
  VALID_CITY_REGEX = /\A[\sA-Za-z]*\z/i.freeze

  belongs_to :user
  belongs_to :category
  has_many :post_attachments
  has_many :reviews
  has_many :messages
  has_and_belongs_to_many :buyers

  accepts_nested_attributes_for :post_attachments

  after_validation { self.ad_title = self.ad_title.squish }
  after_validation { self.detailed_ad_title = self.detailed_ad_title.squish }
  after_validation { self.ad_description = self.ad_description.squish }
  after_validation { self.user_name = self.user_name.squish }
  after_validation { self.phone = self.phone.squish }
  after_validation { self.city = self.city.squish }

  validates :ad_title,  presence: true, length: { maximum: 14, minimum: 2 } , format: { with: VALID_AD_REGEX }
  validates :detailed_ad_title,  presence: true, length: { maximum: 30, minimum: 2 } , format: { with: VALID_AD_REGEX }
  validates :ad_description,  presence: true, length: { maximum: 255, minimum: 2 }
  validates :user_name, presence: true, length: { maximum: 30, minimum: 2 } , format: { with: VALID_USERNAME_REGEX }
  validates :phone, presence: true, length: { maximum: 15, minimum: 10 } , format: { with: VALID_PHONE_REGEX }
  validates :city,  presence: true, length: { maximum: 14, minimum: 1 } , format: { with: VALID_CITY_REGEX }
  validates :user_id, presence: true

  scope :admin_post_state, ->(state) { where(approved_by: state) }
  scope :admin_post_approved_state, -> { where.not(approved_by: ['null', 'rejected']) }
  scope :post_category, ->(category) { where(category_id: category) }
  scope :post_unsold, -> { where(buyer_id: nil) }
  scope :post_ad_title, ->(title) { where("ad_title LIKE ?", "%#{title}%") }
  scope :post_city, ->(name) { where("city LIKE ?", "%#{name}%") }
  scope :product_bought_sold, ->(product_id) { where(buyer_id: product_id) }
  scope :where_post_id, ->(id) { where(id: id) }
  scope :users_post, ->(id) { where(user_id: id) }
  scope :others_post, ->(id) { where.not(user_id: id) }  

  def self.admin_post_approval(value)
    update(approved_by: value)
  end
end
