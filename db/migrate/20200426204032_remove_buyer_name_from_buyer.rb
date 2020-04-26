class RemoveBuyerNameFromBuyer < ActiveRecord::Migration[6.0]
  def change

    remove_column :buyers, :buyer_name, :string
  end
end
