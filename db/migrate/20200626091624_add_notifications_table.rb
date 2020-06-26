class AddNotificationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string "body", null: false
      t.integer "post_id", null: false
      t.integer "receiver_id", null: false
      t.integer "sender_id", null: false
      t.string "unread", default: "true"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
