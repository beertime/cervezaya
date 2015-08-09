class Type < ActiveRecord::Base

  has_and_belongs_to_many :brands

  validates :name, presence: true

  mount_uploader :image, TypeUploader

  def self.brands_count(type_id)
    self.joins(:brands).where(id: type_id).count
  end

end
