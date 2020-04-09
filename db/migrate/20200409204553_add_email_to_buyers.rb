class AddEmailToBuyers < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :email, :string
  end
end
