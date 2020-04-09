class RemoveBuyerIdFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :buyer_id, :integer
  end
end
