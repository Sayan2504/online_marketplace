class RemoveEventFromMessages < ActiveRecord::Migration[6.0]
  def change

    remove_column :messages, :event, :string
  end
end
