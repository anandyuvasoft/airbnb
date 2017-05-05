class UsersController < ApplicationController

  skip_before_action :authenticate_doctor!, :authenticate_patient!

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
    @friends = @user.friends
    @relatives = @user.relatives
    @bookings = @user.bookings
  end

  def family_members
  	@relatives = current_user.relatives
  end

  def friends
  	@friends = current_user.friends
  end

  def remove_relative
    @relative_id = params[:id]
    relative = Relative.find(params[:id])
    relative.destroy
  end

end
