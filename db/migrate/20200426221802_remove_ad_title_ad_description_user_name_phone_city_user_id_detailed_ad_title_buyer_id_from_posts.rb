class RemoveAdTitleAdDescriptionUserNamePhoneCityUserIdDetailedAdTitleBuyerIdFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :ad_title, :string

    remove_column :posts, :ad_description, :text

    remove_column :posts, :user_name, :string

    remove_column :posts, :phone, :string

    remove_column :posts, :city, :string

    remove_column :posts, :user_id, :bigint

    remove_column :posts, :detailed_ad_title, :string

    remove_column :posts, :buyer_id, :integer
  end
end
