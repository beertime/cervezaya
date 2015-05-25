class BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_favorite_id, :user_rank, :products

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
    object.photo.try(:url).to_s.split('/').last
  end

  def rank
    object.rank || 0
  end

  def user_favorite
    favorite = Bar.get_user_favorite(object.id)
    if favorite
      favorite.count > 0
    else
      false
    end
  end

  def user_favorite_id
    favorite = Bar.get_user_favorite(object.id)
    if favorite and favorite[0]
      favorite.id
    else
      nil
    end
  end

  def user_rank
    Bar.get_user_rank(object.id)
  end

end
