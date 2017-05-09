module UsersHelper

  def get_relative_object_helper
    object = params[:relative_id].present? ? Relative.find(params[:relative_id]) : current_patient.relatives.build
  end

end
