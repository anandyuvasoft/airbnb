class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking
end
