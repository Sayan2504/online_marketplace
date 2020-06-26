class DropCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categories do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "name", null: false
    end
  end
end
