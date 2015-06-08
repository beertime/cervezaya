class Brand < ActiveRecord::Base

  default_scope { where(published: true) }

  has_and_belongs_to_many :types

  validates :name, presence: true
  validates_length_of :color, :minimum => 7, :maximum => 7, :allow_blank => true

  mount_uploader :image, LogoUploader
  mount_uploader :alt_image, LogoUploader
  mount_uploader :shadow_image, LogoUploader

end
