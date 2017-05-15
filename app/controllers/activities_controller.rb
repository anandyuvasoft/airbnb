class ActivitiesController < ApplicationController

  skip_before_action :authenticate_doctor!, :authenticate_patient!

  def index
		@activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id)
  end

end
