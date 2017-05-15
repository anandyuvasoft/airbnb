class Condition < ActiveRecord::Base
  has_many :rooms_conditions
  has_many :rooms, through: :rooms_conditions
end
