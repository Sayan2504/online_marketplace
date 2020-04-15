class AddPostIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :post_id, :integer
  end
end
