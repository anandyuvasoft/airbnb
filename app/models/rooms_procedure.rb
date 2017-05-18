class RoomsProcedure < ActiveRecord::Base
  belongs_to :room
  belongs_to :procedure
end
