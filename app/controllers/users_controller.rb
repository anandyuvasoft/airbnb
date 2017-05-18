class UsersController < ApplicationController

  skip_before_action :authenticate_doctor!, :authenticate_patient!
  before_filter :get_user, only: [:show, :relatives, :friends]
  before_filter :get_resources, only: [:show]


  def show;end

  def friends;end

   def remove_relative
    @relative_id = params[:id]
    relative = Relative.find(params[:id])
    relative.destroy
    @count = current_user.relatives.size
  end

  def remove_friend
    @friend_id = params[:id]
    friend = Friend.find(params[:id])
    friend.destroy
    @count = current_user.friends.size
  end

  def remove_booking
    @booking_id = params[:id]
    booking = Booking.find(params[:id])
    booking.destroy
    @count = current_user.bookings.size
  end

  private

  def get_user
    @user = User.find(params[:id])
  end


  def get_resources
    @rooms = @user.rooms.enabled
    @friends = @user.friends
    @relatives = @user.relatives
    @bookings = @user.bookings.enabled
  end



end
