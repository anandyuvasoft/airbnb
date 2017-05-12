class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :booking
  validates_presence_of :fullname
end
