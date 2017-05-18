module BookingsHelper

	def user_booking
		booking = Booking.find_by_user_id_and_room_id(current_patient.id, @room.id)
	end

  def has_booked?
    Booking.find_by_user_id_and_room_id(current_patient.id, @room.id).present?
  end


  def is_user_profile_incomplete?
    !current_patient.gender.present? || !current_patient.birthday.present? 
  end

  def is_friend_profile_incomplete?(friend)
    !friend.gender.present? || !friend.birthday.present? 
  end

end
