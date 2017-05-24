class Award < ActiveRecord::Base
  belongs_to :room
  validates :name, presence: true
  validates :date, presence: true
end
