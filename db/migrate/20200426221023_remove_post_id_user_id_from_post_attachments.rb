class RemovePostIdUserIdFromPostAttachments < ActiveRecord::Migration[6.0]
  def change

    remove_column :post_attachments, :post_id, :integer

    remove_column :post_attachments, :user_id, :integer
  end
end
