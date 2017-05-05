class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # define_completeness_scoring do
  #   check :fullname,lambda { |per| per.fullname.present? }, :high
  # end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}

  has_many :rooms, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :purchases, :dependent => :destroy
  has_many :relatives, :dependent => :destroy
  has_many :friends, :dependent => :destroy
  has_many :bookings, :dependent => :destroy

  accepts_nested_attributes_for :relatives, :friends, :allow_destroy => true, :reject_if => lambda { |a| a[:fullname].blank? }

  #after_create :default_values

  TYPE = [['Doctor','Doctor'],['Patient','Patient']]

  # def default_values
  #   update_attribute(:type, 'Patient')
  # end


  def self.from_omniauth(auth)
    user = User.where(:email => auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
        #user.birthday = Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y')
        #user.gender = auth.extra.raw_info.gender
      end
    end
  end
end
