class Post < ApplicationRecord

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    belongs_to :user, optional: true
    belongs_to :category
end
