class BookingStepsController < ApplicationController
	include Wicked::Wizard
	steps :first, :second

  skip_before_action :authenticate_doctor!
  
  
  def show
  	@room = Room.find(params[:room_id])
    render_wizard
  end	



end
