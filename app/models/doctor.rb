class Doctor < User

  def booked_patients
    Patient.joins(:bookings).where('bookings.room_id IN (?) ', rooms.pluck(:id))
  end

end