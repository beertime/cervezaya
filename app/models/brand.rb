class Brand < ActiveRecord::Base

  validates :name, presence: true
  validates_length_of :color, :minimum => 7, :maximum => 7, :allow_blank => true


  mount_uploader :image, LogoUploader
  mount_uploader :alt_image, LogoUploader
  mount_uploader :shadow_image, LogoUploader

end
