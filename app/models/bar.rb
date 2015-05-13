class Bar < ActiveRecord::Base

  belongs_to :franchise
  has_many :products
  # has_and_belongs_to_many :favorites

  validates :name, presence: true

  mount_uploader :photo, BarUploader

  geocoded_by :address, :latitude  => :latitude, :longitude => :longitude

  paginates_per 25

end
