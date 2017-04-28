class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end

  def family_members
  	@relatives = current_user.relatives
  end

end
