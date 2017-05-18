class Procedure < ActiveRecord::Base
  has_many :rooms_procedures
  has_many :rooms, through: :rooms_procedures  
end
