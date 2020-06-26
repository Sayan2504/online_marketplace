class DropNotificationsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :notifications do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "unread", default: "true"
      t.string "body", null: false
      t.integer "post_id", null: false
      t.integer "receiver_id", null: false
      t.integer "sender_id", null: false
    end
  end
end
