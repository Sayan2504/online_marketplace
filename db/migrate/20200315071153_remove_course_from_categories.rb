class RemoveCourseFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_reference :categories, :course, null: false, foreign_key: true
  end
end
