class AddPostIdToBuyer < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :post_id, :integer, null: false
  end
end
