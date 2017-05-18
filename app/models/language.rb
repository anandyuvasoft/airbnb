class Language < ActiveRecord::Base
  has_many :rooms_languages
  has_many :rooms, through: :rooms_languages  
end
