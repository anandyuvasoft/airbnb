class BookingStepsController < ApplicationController
	include Wicked::Wizard
	steps :first, :second

  skip_before_action :authenticate_doctor!
  
  def show
    case step
    when :first  
      @booking = current_patient.bookings.create(room_id: params[:room_id])
    when :second
      @booking = Booking.find(params[:booking_id])
      @booking.update_attribute(:friend_id, params[:friend_id]) if params[:friend_id].present?  
    end
    render_wizard
  end	

end

