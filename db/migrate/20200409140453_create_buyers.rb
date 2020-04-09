class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :buyer_name
      t.integer :post_id

      t.timestamps
    end
  end
end
