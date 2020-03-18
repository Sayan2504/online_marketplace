class User < ApplicationRecord
    has_secure_password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

    after_validation { self.email = self.email.downcase }

    has_many :posts
    has_and_belongs_to_many :categories
    has_many :post_attachments, through: :posts

    validates :name, presence: true, length: {maximum: 255}
    validates :email, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true, length: { minimum: 6 }
    validates :admin, default: false

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
