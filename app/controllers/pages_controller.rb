class PagesController < ApplicationController
  
  skip_before_action :authenticate_doctor!, :authenticate_patient!
  
  def home;end

  def sample;end
  def test;end

  def dashboard
    @room = current_doctor.rooms.first
    @photos = @room.photos
    @conversations = Conversation.involving(current_doctor)
  end


  def search

    if params[:location].present?
 		 rooms  = Room.near(params[:location], 200, order: 'distance')
    else
      rooms  = Room.all
    end

      rooms = rooms.where(category: params[:category]) if params[:category].present?

      # OPTIMIZE improve the code 
      # TODO photos of a room on google map
      upgraded_rooms = rooms.upgraded
      unupgraded_rooms = rooms - upgraded_rooms
      @rooms = upgraded_rooms + unupgraded_rooms


  end
end
