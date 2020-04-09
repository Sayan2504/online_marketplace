class AddUserIdToBuyers < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :user_id, :integer
  end
end
