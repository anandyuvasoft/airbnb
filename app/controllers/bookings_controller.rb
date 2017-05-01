class BookingsController < ApplicationController

  def create
  	booking = current_user.bookings.create(room_id: params[:room_id])
  	flash[:notice] = "Appointment Booked Successfully!"
  	redirect_to booking.room
  end
  
end
