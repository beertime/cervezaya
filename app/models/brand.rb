class Brand < ActiveRecord::Base

  has_many :types

  # accepts_nested_attributes_for :types, :allow_destroy => false

  validates :name, presence: true

  mount_uploader :image, LogoUploader
  mount_uploader :alt_image, LogoUploader
  mount_uploader :shadow_image, LogoUploader

end
