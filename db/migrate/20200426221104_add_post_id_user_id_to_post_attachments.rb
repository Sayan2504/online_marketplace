class AddPostIdUserIdToPostAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :post_attachments, :post_id, :integer, null: false
    add_column :post_attachments, :user_id, :integer, null: false
  end
end
