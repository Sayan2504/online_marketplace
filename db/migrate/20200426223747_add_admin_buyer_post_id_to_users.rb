class AddAdminBuyerPostIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :buyer_post_id, :integer, null: false
  end
end
