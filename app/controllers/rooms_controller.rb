class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
    @photos = @room.photos

    @booked = Reservation.where("room_id = ? AND user_id = ?", @room.id, current_user.id).present? if current_user

    @reviews = @room.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
    end

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
    byebug
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
    @room.conditions.build
    @room.procedures.build
    @room.insurances.build
    @room.languages.build
    @room.educations.build
  end

  def update
    byebug
    if @room.update(room_params)
      if @room.save
        if params[:images]
          params[:images].each do |image|
            @room.photos.create(image: image)
          end
        end
      end
        redirect_to room_path(@room), notice: "Your room has been successfully updated"
    else
      flash.now[:alert] = @room.errors.full_messages.try(:first)
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
        :conditions_attributes => [:condition],
        :procedures_attributes => [:procedure],
        :insurances_attributes => [:insurance_provider],
        :languages_attributes => [:language],
        :educations_attributes => [:school, :date ] )
    end
end