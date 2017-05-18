module RoomsHelper

  def get_education_object_helper
    object = params[:education_id].present? ? Education.find(params[:education_id]) : @room.educations.build
  end  
end
