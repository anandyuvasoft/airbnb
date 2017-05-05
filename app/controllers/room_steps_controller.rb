class RoomStepsController < ApplicationController
  include Wicked::Wizard
  steps :first, :second, :third

  skip_before_action :authenticate_patient!

  def show
    @room = Room.new
    case step
    when :second
      create_instance
    when :third
      @room.educations.build
    end
  	render_wizard
  end
  
  def create
  	@room = current_user.rooms.build(room_params)
  	if @room.save
  		redirect_to wizard_path(:second, room_id: @room)
		else
      @errors = @room.errors
			render wizard_path(:first, room_id: @room)
  	end
  end

  def update
  	@room = Room.find(params[:room_id])
  	room_params = params[:room].permit!
   	@room.update_attributes(room_params)
    if params[:id].eql? "third"
      redirect_to_finish_wizard
    else
      redirect_to wizard_path(:third, room_id: @room)
    end
  end
  
private

  def room_params
    params.require(:room).permit(:listing_name,:degree, :biography, :category, :practice, :gender,:address)
  end

  def create_instance
    @room.conditions.build
    @room.procedures.build
    @room.insurances.build
    @room.languages.build
    @room.educations.build
  end

  def redirect_to_finish_wizard
    redirect_to room_path(@room), notice: "Room has been successfully created."
  end	
end
