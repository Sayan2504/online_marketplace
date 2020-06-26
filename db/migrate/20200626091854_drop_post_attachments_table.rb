class DropPostAttachmentsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :post_attachments do |t|
      t.string "photo"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "post_id", null: false
      t.integer "user_id", null: false
    end
  end
end
