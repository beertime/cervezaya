class FavoriteSerializer < ActiveModel::Serializer
  attributes :favorite_id, :id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_rank, :user_rank_id,
    :product_name, :product_price, :product_image, :franchise_id, :is_franchise

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
    if object.bar.photo.try(:url)
      object.bar.photo.try(:url).to_s.split('/').last
    else
      object.bar.franchise.try(:photo).try(:url).to_s.split('/').last
    end
  end

  def user_favorite
    Bar.get_user_favorite(object.bar.id)
  end

  def user_rank
    Bar.get_user_rank(object.bar.id)
  end

  def user_rank_id
    Bar.get_user_rank_id(object.id)
  end

  def product_brand_id
    if object.bar.franchise
      object.bar.franchise.try(:products).first.try(:brand).try(:id)
    else
      object.bar.products.first.try(:brand).try(:id)
    end
  end

  def product_image
    if object.bar.franchise
      object.bar.franchise.try(:products).first.try(:brand).try(:image).try(:url).to_s.split('/').last
    else
      object.bar.products.first.try(:brand).try(:image).try(:url).to_s.split('/').last
    end
  end

  def product_name
    if object.bar.franchise
      object.bar.franchise.try(:products).first.try(:brand).try(:name)
    else
      object.bar.products.first.try(:brand).try(:name)
    end
  end

  def product_price
    if object.bar.franchise
      object.bar.franchise.try(:products).first.try(:price).to_f
    else
      object.bar.products.first.try(:price).to_f
    end
  end

  def franchise_id
    object.bar.franchise.try(:id)
  end

  def is_franchise
    object.bar.try(:franchise).try(:id) != nil
  end

end
