class Group < ActiveRecord::Base
  belongs_to :user 
  belongs_to :room
  has_many :invites
end
