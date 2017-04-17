class Procedure < ActiveRecord::Base
  belongs_to :room

  validates :procedure, presence: true
end
