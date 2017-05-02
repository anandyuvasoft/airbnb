class BookingStepsController < ApplicationController
	include Wicked::Wizard
	steps :first, :second
  
  def show
  	@room = Room.find(params[:room_id])
    render_wizard
  end	

end
