class AddNameReviewPostIdEmailLocationRatingToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :name, :string, null: false
    add_column :reviews, :review, :text, null: false
    add_column :reviews, :post_id, :bigint, null: false
    add_column :reviews, :email, :string, null: false
    add_column :reviews, :location, :string, null: false
    add_column :reviews, :rating, :string, null: false
  end
end
