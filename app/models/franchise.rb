class Franchise < ActiveRecord::Base

  has_many :products

  validates :name, presence: true

  mount_uploader :photo, BarUploader

end
