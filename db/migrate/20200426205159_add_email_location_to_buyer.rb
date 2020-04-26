class AddEmailLocationToBuyer < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :email, :string, limit: 255, null: false
    add_column :buyers, :location, :string, limit: 255, null: false
  end
end
