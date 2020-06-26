class AddUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string "name", null: false
      t.string "email", null: false
      t.string "password_digest"
      t.integer "buyer_post_id"
      t.boolean "admin"
      t.string "provider"
      t.string "uid"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
