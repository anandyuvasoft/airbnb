class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking
  validates_presence_of :fullname
end
