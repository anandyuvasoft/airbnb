class PagesController < ApplicationController
  
  skip_before_action :authenticate_doctor!, :authenticate_patient!
  
  def home
    @rooms = Room.upgraded
  end

  def sample;end
  def test;end

  def dashboard
    @rooms = Room.all
    @users = User.all
    @conversations = Conversation.involving(current_user)
  end


  def search

  	# if params[:search].present? && params[:search].strip != ""
  	# 	session[:loc_search] = params[:search]
  	# end

  	arrResult = Array.new

  	if params[:search].present?
  		@rooms_address = Room.near(params[:search], 200, order: 'distance')
  	else
  		@rooms_address = Room.all
  	end

    @rooms_address = @rooms_address.where(category: params[:category]) if params[:category].present?

  	@search = @rooms_address.ransack(params[:q])
  	@rooms = @search.result

  	@arrRooms = @rooms.to_a

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])

  		@rooms.each do |room|

  			not_available = room.reservations.where(
  					"(? <= start_date AND start_date <= ?)
  					OR (? <= end_date AND end_date <= ?)
  					OR (start_date < ? AND ? < end_date)",
  					start_date, end_date,
  					start_date, end_date,
  					start_date, end_date
  				).limit(1)

  			if not_available.length > 0
  				@arrRooms.delete(room)
  			end

  		end

  	end

  end
end
