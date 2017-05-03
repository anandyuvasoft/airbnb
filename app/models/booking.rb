class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  has_many	:friends #referes

  accepts_nested_attributes_for :friends, :friends,  :allow_destroy => true
  
end
