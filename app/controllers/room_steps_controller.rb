class RoomStepsController < ApplicationController
  include Wicked::Wizard
  steps :first, :second, :third

  skip_before_action :authenticate_patient!

  def show
    case step
    when :second
      @room = Room.find(params[:room_id])
      create_instance
    end
  	render_wizard
  end
  
  def create
  	@room = current_doctor.rooms.build(room_params)
  	if @room.save
  		redirect_to wizard_path(:second, room_id: @room)
		else
      @errors = @room.errors
			render wizard_path(:first, room_id: @room)
  	end
  end

  def update
  	@room = Room.find(params[:room_id])
   	@room.update_attributes(room_params)
    if params[:id].eql? "third"
      redirect_to_finish_wizard
    else
      redirect_to wizard_path(:third, room_id: @room)
    end
  end
  
private

  def room_params
    params.require(:room).permit(
      :listing_name,
      :degree, 
      :biography, 
      :category, 
      :practice, 
      :gender,
      :address,
      :price,
      :conditions=>[],
      conditions_attributes: 
        [:id, {:condition=>[]},:_destroy],
      procedures_attributes: 
        [:id, :procedure,:_destroy],
      languages_attributes: 
        [:id, :language, :_destroy],
      insurances_attributes: 
        [:id, :insurance_provider, :_destroy],            
      educations_attributes: 
        [:id, :school, :date ,:_destroy]
      )
  end

  def create_instance
    #@room.conditions.build
    # @room.procedures.build
    # @room.insurances.build
    # @room.languages.build
  end

  def redirect_to_finish_wizard
    redirect_to room_path(@room), notice: "Room has been successfully created."
  end	
end
