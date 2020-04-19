class AddEventToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :event, :string
  end
end
