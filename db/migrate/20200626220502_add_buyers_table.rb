class AddBuyersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint "post_id", null: false
      t.string "buyer_name", null: false
      t.string "email", null: false
      t.string "location"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
