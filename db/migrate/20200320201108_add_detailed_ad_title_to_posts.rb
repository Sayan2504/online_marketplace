class AddDetailedAdTitleToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :detailed_ad_title, :string
  end
end
