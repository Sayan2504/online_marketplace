class AddBuyerNamePostIdUserIdEmailLocationToBuyers < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :buyer_name, :string, null: false
    add_column :buyers, :post_id, :integer, null: false
    add_column :buyers, :user_id, :integer, null: false
    add_column :buyers, :email, :string, null: false
    add_column :buyers, :location, :string, null: false
  end
end
