class RemoveBodyPostIdReceiverIdFromMessages < ActiveRecord::Migration[6.0]
  def change

    remove_column :messages, :body, :text

    remove_column :messages, :post_id, :bigint

    remove_column :messages, :receiver_id, :integer
  end
end
