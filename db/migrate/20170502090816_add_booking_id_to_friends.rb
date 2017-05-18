class AddBookingIdToFriends < ActiveRecord::Migration
  def change
    add_reference :friends, :booking, index: true, foreign_key: true
   	rename_column :friends, :date_of_birth, :birthday
   	rename_column :friends, :phone, :phone_number
   	remove_column :friends, :age
  end
end
