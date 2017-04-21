class Photo < ActiveRecord::Base
  belongs_to :room

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
  default_url: "https://thumb.ibb.co/jBGmFk/logo.png" , 
  storage: :dropbox,
  dropbox_credentials: "#{Rails.root}/config/dropbox.yml"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
