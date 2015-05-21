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
    products = object.products
    if products.count > 0
      brand = products.first.try(:brand)
      if brand
        brand.try(:image).try(:url)
      end
    else
      nil
    end
  end

  def product_name
    products = object.products
    if products.count > 0
      products.first.try(:brand)
      if brand
        brand.try(:name)
      end
    else
      nil
    end
  end

  def product_price
    products = object.products
    if products.count > 0
      products.first.try(:price)
    else
      nil
    end
  end

end
