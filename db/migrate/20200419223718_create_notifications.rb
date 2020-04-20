class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :body
      t.integer :receiver_id
      t.integer :post_id

      t.timestamps
    end
  end
end
