class Insurance < ActiveRecord::Base
  belongs_to :room
  validates :insurance_provider, presence: true
  TYPES = [['American','American'],['Red Cross','Red Cross']]

end
