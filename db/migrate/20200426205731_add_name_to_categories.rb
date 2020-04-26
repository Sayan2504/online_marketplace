class AddNameToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :string, limit: 255, null: false
  end
end
