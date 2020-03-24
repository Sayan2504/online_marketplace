class AddLocationToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :location, :string
  end
end
