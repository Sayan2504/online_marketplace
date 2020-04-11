class AddCategoryIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category_id, :integer, default: 0
  end
end