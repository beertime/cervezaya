class Promotion < ActiveRecord::Base

  validates :title, presence: true

  mount_uploader :image, PromotionUploader

end
