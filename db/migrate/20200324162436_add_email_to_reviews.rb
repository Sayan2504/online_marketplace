class AddEmailToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :email, :string
  end
end
