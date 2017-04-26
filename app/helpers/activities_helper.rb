module ActivitiesHelper
	def notification
		activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.id)
	end
end
