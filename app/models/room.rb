class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews
  has_many :purchases
  
  

  geocoded_by :full_street_address
  after_validation :geocode
  
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true


  def full_street_address
  [street, city, state, zipcode, country].compact.join(', ')
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

  

end
