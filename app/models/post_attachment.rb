class PostAttachment < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    belongs_to :post
   
    validates :photo, :presence => true
end
