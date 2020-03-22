class RemovePostIdFromReviews < ActiveRecord::Migration[6.0]
  def change

    remove_column :reviews, :post_id, :integer
  end
end
