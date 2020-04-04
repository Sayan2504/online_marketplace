class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :category, :category_id, :default => 0
  end
end
