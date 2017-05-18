module UsersHelper

  def get_relative_object_helper
    object = params[:relative_id].present? ? Relative.find(params[:relative_id]) : current_patient.relatives.build
  end

  def get_friend_object_helper
    object = params[:friend_id].present? ? Friend.find(params[:friend_id]) : current_user.friends.build
  end


end
