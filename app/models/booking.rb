class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  belongs_to :friend

  accepts_nested_attributes_for :friend, :user, :allow_destroy => true
  
  default_scope { where(status: true) }


end
