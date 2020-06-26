class AddPostAttachmentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :post_attachments do |t|
      t.references :post, null: false, foreign_key: true
      t.integer "user_id", null: false
      t.string "photo"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
