class BarSerializer < ActiveModel::Serializer

  attributes :id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_rank,
    :product_name, :product_price, :product_image

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def rank
    object.rank || 0
  end

  def photo
    object.photo.try(:url).to_s.split('/').last
  end

  def user_favorite
    Bar.get_user_favorite(object.id)
  end

  def user_rank
    Bar.get_user_rank(object.id)
  end

  def product_image
    if object.franchise
      object.franchise.try(:products).first.try(:brand).try(:image).try(:url)
    else
      object.products.first.try(:brand).try(:image).try(:url)
    end
  end

  def product_name
    if object.franchise
      object.franchise.try(:products).first.try(:brand).try(:name)
    else
      object.products.first.try(:brand).try(:name)
    end
  end

  def product_price
    if object.franchise
      object.franchise.try(:products).first.try(:price)
    else
      object.products.first.try(:price)
    end
  end

end
