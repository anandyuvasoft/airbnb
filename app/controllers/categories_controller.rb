class CategoriesController < ApplicationController

  skip_before_action :authenticate_doctor!, :authenticate_patient!  


  def show
    category_name = Category.friendly.find(params[:id]).name
    @rooms = Room.where(category: category_name)
  end


end
