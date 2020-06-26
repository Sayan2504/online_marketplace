class DropBuyersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :buyers do |t|
      t.bigint "user_id", null: false
      t.bigint "post_id", null: false
      t.string "buyer_name", null: false
      t.string "email", null: false
      t.string "location", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["post_id"], name: "index_buyers_on_post_id"
      t.index ["user_id"], name: "index_buyers_on_user_id"
    end
  end
end
