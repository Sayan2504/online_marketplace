class CreatePostAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :photo

      t.timestamps
    end
  end
end
