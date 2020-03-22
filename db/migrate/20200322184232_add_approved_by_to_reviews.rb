class AddApprovedByToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :approved_by, :string,  default: "null"
  end
end
