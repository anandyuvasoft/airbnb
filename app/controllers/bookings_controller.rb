class BookingsController < ApplicationController

  skip_before_action :authenticate_doctor!

  def create
    booking = current_user.bookings.create(room_id: params[:room_id])

    if params[:booking].present?
      booking.update_attributes(booking_params)
    else
      current_user.update_attributes(user_params)
    end

    flash[:notice] = "Appointment Booked Successfully!"
    redirect_to booking.room
  end
  

  def index
    @bookings = current_user.bookings
  end


  private

  def booking_params
    params.require(:booking).permit(friends_attributes: [:fullname, :email, :birthday, :gender])
  end

  def user_params
    params.require(:patient).permit(:fullname, :email, :gender, :birthday)
  end

end
