module ActivitiesHelper
	def notification
		PublicActivity::Activity.order("created_at desc").where(" owner_id = #{current_user.id} AND trackable_type = 'Room' OR recipient_id = #{current_user.id}")
	end
end
