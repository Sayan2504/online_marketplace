class RemovePostIdFromBuyer < ActiveRecord::Migration[6.0]
  def change

    remove_column :buyers, :post_id, :integer
  end
end
