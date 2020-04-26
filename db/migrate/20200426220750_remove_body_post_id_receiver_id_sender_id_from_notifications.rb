class RemoveBodyPostIdReceiverIdSenderIdFromNotifications < ActiveRecord::Migration[6.0]
  def change

    remove_column :notifications, :body, :string

    remove_column :notifications, :post_id, :integer

    remove_column :notifications, :receiver_id, :integer

    remove_column :notifications, :sender_id, :integer
  end
end
