class RoomStepsController < ApplicationController
  include Wicked::Wizard
  steps :step_one, :step_second, :step_third
  
  def show
    @room = Room.new
  	render_wizard
  end
  
  def create
  	room_params = params[:room].permit!
  	@room = Room.new(room_params)
  	if @room.save
  		redirect_to wizard_path(:step_second, room_id: @room)
		else
			render_wizard
  	end
  end

  def update
  	@room = Room.find(params[:room_id])
  	room_params = params[:room].permit!
   	@room.update_attributes(room_params)
    if params[:id].eql? "step_third"
      redirect_to_finish_wizard
    else
      redirect_to wizard_path(:step_third, room_id: @room)
    end
  end
  
private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Great! Room has been successfully created."
  end	
end
