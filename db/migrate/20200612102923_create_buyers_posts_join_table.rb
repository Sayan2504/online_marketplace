class CreateBuyersPostsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :buyers, :posts
  end
end
