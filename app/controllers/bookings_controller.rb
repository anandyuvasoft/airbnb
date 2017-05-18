class BookingsController < ApplicationController

  skip_before_action :authenticate_doctor!

  def create
    @booking = current_patient.bookings.create(room_id: params[:room_id])
    redirect_to booking_steps_path(booking_id: @booking.id)
  end
  

  def update
    booking = Booking.find(params[:id])
    if booking.update_attributes(booking_params) 
      flash[:notice] = "Your appointment has been booked."
      redirect_to booking.user
    else
      flash[:error] = "Something went wrong"
      redirect_to booking.user
    end
  end


  def index
    @bookings = current_patient.bookings
  end


  private

  def booking_params
    params.require(:booking).permit(:status, :friend_id, user_attributes: [:fullname, :email,:birthday, :gender,:id], friend_attributes: [:fullname, :email, :birthday, :gender,:id, :user_id])
  end

end
