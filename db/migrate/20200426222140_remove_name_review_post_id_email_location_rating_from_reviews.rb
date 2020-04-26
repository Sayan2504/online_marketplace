class RemoveNameReviewPostIdEmailLocationRatingFromReviews < ActiveRecord::Migration[6.0]
  def change

    remove_column :reviews, :name, :string

    remove_column :reviews, :review, :text

    remove_column :reviews, :post_id, :bigint

    remove_column :reviews, :email, :string

    remove_column :reviews, :location, :string

    remove_column :reviews, :rating, :string
  end
end
