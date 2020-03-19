class AddApprovedByToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :approved_by, :string,  default: "users"
  end
end
