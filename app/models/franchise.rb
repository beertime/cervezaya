class Franchise < ActiveRecord::Base

  has_many :products
  has_many :bars

  validates :name, presence: true

  mount_uploader :photo, BarUploader

end
