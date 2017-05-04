class Procedure < ActiveRecord::Base
  belongs_to :room
  validates :procedure, presence: true
  TYPES = [['Red','Red'],['Orange','Orange']]

end
