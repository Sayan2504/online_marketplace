class AddUserIdToPostAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :post_attachments, :user_id, :integer
  end
end
