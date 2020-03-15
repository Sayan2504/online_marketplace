class AddPostToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :post, null: false, foreign_key: true
  end
end
