class FavoriteSerializer < ActiveModel::Serializer
  attributes :favorite_id, :id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_rank,
    :product_name, :product_price, :product_image, :is_franchise

  def favorite_id
    object.id
  end

  def id
    object.bar_id
  end

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def name
    object.bar.try(:name)
  end

  def address
    object.bar.try(:address)
  end

  def region
    object.bar.try(:region)
  end

  def phone
    object.bar.try(:phone)
  end

  def rank
    object.bar.try(:rank) || 0
  end

  def latitude
    object.bar.try(:latitude)
  end

  def longitude
    object.bar.try(:longitude)
  end

  def photo
    object.bar.try(:photo).try(:url).to_s.split('/').last
  end

  def user_favorite
    true
  end

  def user_rank
    # Bar.get_user_rank(object.bar_id)
    nil
  end

  def product_image
    if object.bar
      object.bar.products.first.try(:brand).try(:image).try(:url)
    else
      nil
    end
  end

  def product_name
    if object.bar
      object.bar.products.first.try(:brand).try(:brand)
    else
      nil
    end
  end

  def product_price
    if object.bar
      object.bar.products.first.try(:price)
    end
  end

  def is_franchise
    object.bar.try(:franchise).try(:id) != nil
  end

end
