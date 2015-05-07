class Bar < ActiveRecord::Base

  belongs_to :franchise
  has_many :products

  validates :name, presence: true

  mount_uploader :photo, BarUploader

end
