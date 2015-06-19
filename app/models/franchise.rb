class Franchise < ActiveRecord::Base

  has_many :products
  has_many :bars

  validates :name, presence: true

  mount_uploader :photo, BarUploader

  accepts_nested_attributes_for :products, allow_destroy: true

end
