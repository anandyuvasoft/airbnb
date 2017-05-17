class ActivitiesController < ApplicationController

  skip_before_action :authenticate_doctor!, :authenticate_patient!

  def index
		@activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id)
    @activities.update_all(is_read: true)
  end


  def mark_as_read
    @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id).limit(5).update_all(is_read: true)
    render nothing: true
  end


end
