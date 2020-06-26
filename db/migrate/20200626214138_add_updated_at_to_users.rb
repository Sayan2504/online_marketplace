class AddUpdatedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :updated_at, :datetime, precision: 6, null: false
  end
end
