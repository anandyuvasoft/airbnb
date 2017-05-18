class Room < ActiveRecord::Base

  include PublicActivity::Common
  geocoded_by :address

  belongs_to :user
  has_many :photos, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :purchases, :dependent => :destroy
  has_many :specialities, :dependent => :destroy
  has_many :educations, :dependent => :destroy
  has_many :bookings, :dependent => :destroy

  has_many :rooms_conditions
  has_many :conditions, through: :rooms_conditions

  has_many :rooms_procedures
  has_many :procedures, through: :rooms_procedures

  has_many :rooms_insurances
  has_many :insurances, through: :rooms_insurances

  has_many :rooms_languages
  has_many :languages, through: :rooms_languages    


  accepts_nested_attributes_for :conditions, :specialities, :procedures, :insurances, :languages, :educations, :photos, :allow_destroy => true

  validates :listing_name, presence: true, length: {maximum: 50}
  validates :address, presence: true


  after_update :send_notification_after_activated
  after_create :send_notification_after_create
  after_validation :geocode
  
  scope :upgraded, -> { joins(:purchases).where('purchases.purchased_at >= ?', DateTime.now.to_date-30) }
  
  ## TODO need to be set false for now
  scope :enabled, -> { where(is_admin_active: false) }

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

  def is_upgraded?
    if purchases.present? 
      last_upgrade = purchases.last
      last_upgrade.purchased_at.present? && ( DateTime.now.to_date - last_upgrade.purchased_at.to_date).to_i < 31
    end
  end
  
  private

  def send_notification_after_activated
    self.create_activity :update, owner: self.user, recipient: self.user if (self.is_admin_active_changed? && self.is_admin_active == true)
  end

  def send_notification_after_create
    self.create_activity :create, owner: self.user , recipient: self.user
  end


end
