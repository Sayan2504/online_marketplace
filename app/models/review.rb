class Review < ApplicationRecord
    belongs_to :post, optional: true
end
