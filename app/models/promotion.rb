class Promotion < ActiveRecord::Base

  belongs_to :bar

  validates :title, presence: true

  mount_uploader :image, PromotionUploader

end
