class Education < ActiveRecord::Base
  belongs_to :room

  validates :school, presence: true
  validates :date, presence: true
end
