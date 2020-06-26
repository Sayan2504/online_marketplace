class AddBuyersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string "buyer_name", null: false
      t.string "email", null: false
      t.string "location", null: false
      t.integer "post_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
