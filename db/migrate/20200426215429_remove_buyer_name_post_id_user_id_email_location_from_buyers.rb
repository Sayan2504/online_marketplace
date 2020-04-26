class RemoveBuyerNamePostIdUserIdEmailLocationFromBuyers < ActiveRecord::Migration[6.0]
  def change

    remove_column :buyers, :buyer_name, :string

    remove_column :buyers, :post_id, :integer

    remove_column :buyers, :user_id, :integer

    remove_column :buyers, :email, :string

    remove_column :buyers, :location, :string
  end
end
