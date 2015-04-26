class Brand < ActiveRecord::Base

  validates :name, presence: true

  mount_uploader :image, LogoUploader
  mount_uploader :alt_image, LogoUploader
  mount_uploader :shadow_image, LogoUploader

end
