class DropReviewsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :reviews do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "approved_by", default: "null"
      t.string "name", null: false
      t.text "review", null: false
      t.bigint "post_id", null: false
      t.string "email", null: false
      t.string "location", null: false
      t.string "rating", null: false
    end
  end
end
