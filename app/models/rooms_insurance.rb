class RoomsInsurance < ActiveRecord::Base
  belongs_to :room
  belongs_to :insurance
end
