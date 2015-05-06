class Bar < ActiveRecord::Base

  belongs_to :franchise

  validates :name, presence: true

  mount_uploader :photo, BarUploader

end
