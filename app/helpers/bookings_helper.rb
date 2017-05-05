module BookingsHelper

	def user_booking
		booking = Booking.find_by_user_id_and_room_id(current_patient.id, @room.id)
	end


end
