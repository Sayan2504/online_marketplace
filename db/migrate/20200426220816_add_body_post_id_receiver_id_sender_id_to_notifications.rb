class AddBodyPostIdReceiverIdSenderIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :body, :string, null: false
    add_column :notifications, :post_id, :integer, null: false
    add_column :notifications, :receiver_id, :integer, null: false
    add_column :notifications, :sender_id, :integer, null: false
  end
end
