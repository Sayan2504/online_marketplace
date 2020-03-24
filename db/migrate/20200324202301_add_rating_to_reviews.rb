class AddRatingToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :rating, :string
  end
end
