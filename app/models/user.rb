class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i.freeze

  after_validation { self.email = self.email.downcase }
  after_validation { self.name = self.name.squish }

  has_many :posts
  has_many :messages
  has_one :buyer
  has_many :post_attachments, through: :posts
  has_many :reviews, through: :posts

  validates :name, presence: true, length: { maximum: 30, minimum: 2 } , format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 80, minimum: 5 } , uniqueness: { case_sensitive: false } , format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { maximum: 30, minimum: 6 } , on: :create          
  validates :admin, default: false

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth["provider"], uid: auth["uid"]) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth["provider"],
      uid: auth["uid"],
      name: auth["info"]["name"],
      email: auth["info"]["email"],
      password: "11111111"
    )
  end
end
