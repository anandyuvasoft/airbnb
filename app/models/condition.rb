class Condition < ActiveRecord::Base
  belongs_to :room
  
  validates :condition, presence: true
end
