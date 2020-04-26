class RemoveEmailLocationFromBuyer < ActiveRecord::Migration[6.0]
  def change

    remove_column :buyers, :email, :string

    remove_column :buyers, :location, :string
  end
end
