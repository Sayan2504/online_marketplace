class RemoveCreatedAtFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :created_at, :datetime
  end
end
