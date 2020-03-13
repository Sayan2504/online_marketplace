class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :ad_title
      t.integer :category
      t.text :ad_description
      t.string :user_name
      t.string :phone
      t.string :city

      t.timestamps
    end
  end
end
