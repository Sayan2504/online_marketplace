class AddPostsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string "ad_title", null: false
      t.string "user_name", null: false
      t.string "city", null: false
      t.string "detailed_ad_title"
      t.text "ad_description"
      t.string "phone"
      t.string "approved_by", default: "null"
      t.integer "category_id", default: 0
      t.integer "buyer_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
