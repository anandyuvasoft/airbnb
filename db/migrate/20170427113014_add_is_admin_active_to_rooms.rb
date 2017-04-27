class AddIsAdminActiveToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :is_admin_active, :boolean, default: false
  end
end
