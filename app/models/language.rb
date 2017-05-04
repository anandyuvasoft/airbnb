class Language < ActiveRecord::Base
  belongs_to :room
  validates :language, presence: true
  TYPES = [['English','English'],['Spanish','Spanish']]

end
