class Insurance < ActiveRecord::Base
  has_many :rooms_insurances
  has_many :rooms, through: :rooms_insurances    
end
