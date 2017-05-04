class Condition < ActiveRecord::Base
  belongs_to :room
  
  validates :condition, presence: true

  TYPES = [['White','White'],['Black','Black']]

end
