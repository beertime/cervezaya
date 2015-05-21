class BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_rank

  has_many :products

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def photo
    object.photo.try(:url).to_s.split('/').last
  end

  def rank
    object.rank || 0
  end

  def user_favorite
    Bar.get_user_favorite(object.id)
  end

  def user_rank
    Bar.get_user_rank(object.id)
  end

end
