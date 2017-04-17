class Insurance < ActiveRecord::Base
  belongs_to :room

  validates :insurance_provider, presence: true
end
