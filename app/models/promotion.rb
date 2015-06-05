class Promotion < ActiveRecord::Base

  default_scope { where(published: true) }
  default_scope { order('end_date') }

  belongs_to :bar

  validates :title, presence: true

  mount_uploader :image, PromotionUploader

end
