class AddBuyerNameToBuyer < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :buyer_name, :string, limit: 255, null: false
  end
end
