class RemoveBookingIdFromFriends < ActiveRecord::Migration
  def change
    # TODO not remove the column booking_id from friends table
    #remove_column :friends, :booking_id
    add_column :bookings, :friend_id, :integer
  end
end
