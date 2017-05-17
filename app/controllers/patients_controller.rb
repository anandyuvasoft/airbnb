class PatientsController < UsersController


  def relatives;end

  def bookings
    @user = User.find(params[:id])
  end

end
