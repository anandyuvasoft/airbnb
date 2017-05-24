class AddColumsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :dob, :date
    add_column :rooms, :practice_year_opened, :string
    add_column :rooms, :wikipedia, :string
  end
end
