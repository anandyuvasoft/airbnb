class ChangeBirthdayTypeFromBookings < ActiveRecord::Migration
  def change
		change_column :friends, :birthday, :datetime
  end
end
