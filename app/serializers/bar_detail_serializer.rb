class BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_favorite_id, :user_rank, :products, :is_franchise

  has_many :products

  def is_franchise
    object.franchise.try(:id) != nil
  end

  def products
    if object.franchise
      object.franchise.try(:products)
    else
      object.products
    end
  end

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def photo
    unless object.photo
      object.photo.try(:url).to_s.split('/').last
    else
      object.franchise.try(:photo).try(:url).to_s.split('/').last
    end
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

  def user_favorite_id
    Bar.get_user_favorite_id(object.id)
  end

end
