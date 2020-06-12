class CreateCategoriesUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :users
  end  
end
