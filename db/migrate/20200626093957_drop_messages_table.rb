class DropMessagesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :messages do |t|
      t.bigint "user_id", null: false
      t.text "body", null: false
      t.bigint "post_id", null: false
      t.integer "receiver_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
  end
end
