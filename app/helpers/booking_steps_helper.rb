module BookingStepsHelper

  def get_booking_friend_object_helper
    object = params[:friend_id].present? ? Friend.find(params[:friend_id]) : @booking.build_friend
  end


end
