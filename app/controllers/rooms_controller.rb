class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update]
  before_action :resources, only: [:show]
  before_action :create_instance, only: [:edit]

  skip_before_action :authenticate_patient!, :authenticate_doctor!

  def index
    @rooms = current_user.rooms.enabled.paginate(:page => params[:page], :per_page => 5)
  end

  def show;end

  def new
    @room = current_user.rooms.build
    @room.conditions.build
    @room.procedures.build
    @room.insurances.build
    @room.languages.build
    @room.educations.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      @photos = @room.photos
      @room.create_activity :create, owner: current_user, recipient: current_user
      redirect_to edit_room_path(@room), notice: "Saved!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(room_params)
      redirect_to room_path(@room), notice: "Your room has been successfully updated."
    else
      @errors = @room.errors
      render :edit
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(
        :listing_name, :zipcode, :street, :city, :state, :country, :price, :active, :degree, :biography, :category, :practice, :gender,:address,
        :conditions_attributes => [:condition,:_destroy,:id],
        :procedures_attributes => [:procedure,:_destroy,:id],
        :insurances_attributes => [:insurance_provider,:_destroy,:id],
        :languages_attributes => [:language,:_destroy,:id],
        :educations_attributes => [:school, :date,:_destroy,:id ],
        :condition_ids=>[],
        :language_ids=>[],
        :insurance_ids=>[],
        :procedure_ids=>[],
        :photos_attributes => [:image]
         )
    end

    def create_instance
      @room.conditions.build
      @room.procedures.build
      @room.insurances.build
      @room.languages.build
      @room.educations.build
    end

    def resources
      @photos = @room.photos
      @reviews = @room.reviews
      @bookings = @room.bookings
    end


end