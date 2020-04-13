class RemoveBuyerPostIdFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :buyer_post_id, :integer
  end
end
