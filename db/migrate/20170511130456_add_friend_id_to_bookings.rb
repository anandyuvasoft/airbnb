class AddFriendIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :friend_id, :integer
    remove_reference :friends, :booking, index: true, foreign_key: true
  end
end
