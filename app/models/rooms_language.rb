class RoomsLanguage < ActiveRecord::Base
  belongs_to :room
  belongs_to :language
end
