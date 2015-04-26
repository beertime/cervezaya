class Bar < ActiveRecord::Base

  validates :name, presence: true

  mount_uploader :photo, BarUploader

end
