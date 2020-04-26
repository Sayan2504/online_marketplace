class AddAdTitleAdDescriptionUserNamePhoneCityUserIdDetailedAdTitleBuyerIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :ad_title, :string, null: false
    add_column :posts, :ad_description, :text, null: false
    add_column :posts, :user_name, :string, null: false
    add_column :posts, :phone, :string, null: false
    add_column :posts, :city, :string, null: false
    add_column :posts, :user_id, :bigint, null: false
    add_column :posts, :detailed_ad_title, :string, null: false
    add_column :posts, :buyer_id, :integer, null: false
  end
end
