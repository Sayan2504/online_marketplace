class AddPostIdReceiverIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :post_id, :bigint, null: false
    add_column :messages, :receiver_id, :integer, null: false
  end
end
