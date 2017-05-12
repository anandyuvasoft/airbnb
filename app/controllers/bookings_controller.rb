class BookingsController < ApplicationController

  skip_before_action :authenticate_doctor!

  def create
    booking = current_patient.bookings.create(room_id: params[:room_id])
    booking.update_attributes(booking_params) if params[:booking].present?
    flash[:notice] = "Your appointment has been booked."
    redirect_to booking.user
  end
  

  def index
    @bookings = current_patient.bookings
  end


  private

  def booking_params
    params.require(:booking).permit(patient_attributes: [:birthday, :gender,:id], friend_attributes: [:fullname, :email, :birthday, :gender])
  end

end
