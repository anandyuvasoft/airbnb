class BookingStepsController < ApplicationController
	include Wicked::Wizard
	steps :first, :second

  skip_before_action :authenticate_doctor!
  
  
  def show
    @booking = Booking.find(params[:booking_id])
    case step
    when :second
      @booking.update_attribute(:friend_id, params[:friend_id]) if params[:friend_id].present?  
    end
    render_wizard
  end	



end



# case step
# when :second
#   @booking.update_attribute(:friend_id, params[:friend_id]) if params[:friend_id].present?
# end  