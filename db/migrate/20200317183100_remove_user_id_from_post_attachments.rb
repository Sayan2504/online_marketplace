class RemoveUserIdFromPostAttachments < ActiveRecord::Migration[6.0]
  def change

    remove_column :post_attachments, :user_id, :integer
  end
end
