class Relative < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :relation
end
