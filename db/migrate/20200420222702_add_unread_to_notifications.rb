class AddUnreadToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :unread, :string,  default: "true"
  end
end
