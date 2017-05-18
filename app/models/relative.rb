class Relative < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :fullname, :relation
end
