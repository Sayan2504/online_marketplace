class RemoveUserIdFromBuyer < ActiveRecord::Migration[6.0]
  def change

    remove_column :buyers, :user_id, :integer
  end
end
