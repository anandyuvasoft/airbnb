module DoctorsHelper

  def is_room_approved
    current_doctor.rooms.where(is_admin_active: true).present? ? true : false 
  end

  def is_friend_refered
    current_doctor.friends.present? ? true : false 
  end

  def is_upgrade
    current_doctor.purchases.present? ? true : false
  end 


end
