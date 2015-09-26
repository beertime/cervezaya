class Zone < ActiveRecord::Base

  validates :name, presence: true
  validates :geometry, presence: true
  validates :city, presence: true
  validates :country, presence: true

  mount_uploader :image, BarUploader
end
