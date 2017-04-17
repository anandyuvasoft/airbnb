class Language < ActiveRecord::Base
  belongs_to :room

  validates :language, presence: true
end
