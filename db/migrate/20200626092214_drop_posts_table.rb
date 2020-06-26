class DropPostsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :posts do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "approved_by", default: "null"
      t.integer "category_id", default: 0
      t.integer "buyer_id"
      t.string "ad_title", null: false
      t.text "ad_description", null: false
      t.string "user_name", null: false
      t.string "phone", null: false
      t.string "city", null: false
      t.bigint "user_id", null: false
      t.string "detailed_ad_title", null: false
    end
  end
end
