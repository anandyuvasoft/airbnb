class Room < ActiveRecord::Base

  include PublicActivity::Common
  geocoded_by :full_street_address

  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews
  has_one  :purchase
  has_many :specialities
  has_many :procedures
  has_many :conditions
  has_many :insurances
  has_many :languages
  has_many :educations

  accepts_nested_attributes_for :conditions, :specialities, :procedures, :insurances, :languages, :educations, :photos

  validates :listing_name, presence: true, length: {maximum: 50}
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true


  after_update :send_notification_after_activated
  after_create :send_notification_after_create
  after_validation :geocode
  
  scope :upgraded, -> { joins(:purchase).where('purchases.purchased_at <= ?', DateTime.now.to_date+30) }

  def full_street_address
  [street, city, state, zipcode, country].compact.join(', ')
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

  def is_upgraded?
    self.purchase.purchased_at.present? && (DateTime.now.to_date-self.purchase.purchased_at.to_date).to_i < 31
  end
  
  private

  def send_notification_after_activated
    self.create_activity :update, owner: self.user, recipient: self.user if (self.is_admin_active_changed? && self.is_admin_active == true)
  end

  def send_notification_after_create
    self.create_activity :create, owner: self.user , recipient: self.user
  end


end
