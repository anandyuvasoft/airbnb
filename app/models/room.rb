class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews
  has_many :purchases
  has_many :specialities
  has_many :procedures
  has_many :conditions
  has_many :insurances
  has_many :languages
  has_many :educations
  after_update :send_notification

  def send_notification
    self.create_activity :update, owner: self.user, recipient: self.user   if (self.active_changed? && self.active == true)
  end


  accepts_nested_attributes_for :conditions, :specialities, :procedures, :insurances, :languages, :educations, :photos
    
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }

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
