class RoomsCondition < ActiveRecord::Base
  belongs_to :room
  belongs_to :condition
end
