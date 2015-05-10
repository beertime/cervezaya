class BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank, :latitude, :longitude,
    :photo_small, :photo_medium, :photo_large,
    :user_favorite, :user_rank

  has_many :products

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def user_favorite
    false
  end

  def user_rank
    0
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
