class BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description,
    :photo_small, :photo_medium, :photo_large, :address, :phone, :rank,
    :latitude, :longitude, :favorite

  has_many :products

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def favorite
    false
  end

  def photo_small
    "#{object.photo.small}"
  end

  def photo_medium
    "#{object.photo.medium}"
  end

  def photo_large
    "#{object.photo.large}"
  end

  def rank
    object.rank || 0
  end

end
