class PostAttachment < ApplicationRecord
  attr_accessor :photo
  mount_uploader :photo, PhotoUploader
  
  belongs_to :post
  
  validates :post_id, presence: true
  validates :user_id, presence: true
end
