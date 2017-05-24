class RoomStepsController < ApplicationController
  include Wicked::Wizard
  steps :first, :second, :third
  before_action :set_room, only: [:update ]
  skip_before_action :authenticate_patient!

  def show
    case step
    when :second
      @room = Room.find(params[:room_id])
      create_instance
    when :third
      @room = Room.find(params[:room_id])
      @room.educations.build
      @room.breakthroughs.build
      @room.awards.build
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
   	@room.update_attributes(room_params)
    emails_ids = params[:email_ids].split(' ')
    emails_ids.each do |email|
      @invite = Invite.create(email: email, group_id: @room.groups.last.id,sender_id: current_doctor.id)
      if @invite.recipient != nil 
        InviteMailer.existing_user_invite(@invite).deliver 
        @invite.recipient.groups.push(@invite.group)
      else
        InviteMailer.new_user_invite(@invite, new_user_registration_url(invite_token: @invite.token)).deliver_now
      end
    end
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
      :dob,
      :website,
      :medical_license_number,
      :practice_year_opened,
      :wikipedia,
      :condition_ids=>[],
      :language_ids=>[],
      :insurance_ids=>[],
      :procedure_ids=>[],
      :member_ids=>[],
      :conditions=>[],
      # conditions_attributes: 
      #   [:id, {:condition=>[]},:_destroy, :name=>[]],
      # procedures_attributes: 
      #   [:id, :procedure,:_destroy],
      # languages_attributes: 
      #   [:id, :language, :_destroy],
      # insurances_attributes: 
      #   [:id, :insurance_provider, :_destroy],            
      educations_attributes: 
         [:id, :school, :date ,:_destroy],
      breakthroughs_attributes: 
         [:id, :name, :date ,:_destroy],
      awards_attributes: 
         [:id, :name, :date ,:_destroy]      
      )
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def create_instance
  end

  def redirect_to_finish_wizard
    redirect_to room_path(@room), notice: "Room has been successfully created."
  end	
end
