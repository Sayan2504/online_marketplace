class AddCourseToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :course, null: false, foreign_key: true
  end
end
