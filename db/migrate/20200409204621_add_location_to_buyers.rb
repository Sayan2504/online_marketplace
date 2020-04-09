class AddLocationToBuyers < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :location, :string
  end
end
