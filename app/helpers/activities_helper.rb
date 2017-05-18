module ActivitiesHelper
	def unread_notification
		PublicActivity::Activity.order("created_at desc").where("is_read = 0 AND owner_id = #{current_user.id} AND trackable_type = 'Room' OR is_read = 0 AND recipient_id = #{current_user.id}")
	end
end
