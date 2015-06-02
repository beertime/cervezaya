class BarSerializer < ActiveModel::Serializer

  attributes :id, :name, :address, :region, :phone,
    :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_rank, :user_rank_id,
    :product_brand_id, :product_name, :product_price, :product_image,
    :franchise_id, :is_franchise

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def rank
    object.rank || 0
  end

  def photo
    if object.photo.try(:url)
      object.photo.try(:url).to_s.split('/').last
    else
      object.franchise.try(:photo).try(:url).to_s.split('/').last
    end
  end

  def user_favorite
    Bar.get_user_favorite(object.id)
  end

  def user_rank_id
    Bar.get_user_rank_id(object.id)
  end

  def user_rank
    Bar.get_user_rank(object.id)
  end

  def product_image
    if object.franchise
      object.franchise.try(:products).order(price: :asc).first.try(:brand).try(:image).try(:url).to_s.split('/').last
    else
      object.products.order(price: :asc).first.try(:brand).try(:image).try(:url).to_s.split('/').last
    end
  end

  def product_brand_id
    if object.franchise
      object.franchise.try(:products).order(price: :asc).first.try(:brand).try(:id)
    else
      object.products.order(price: :asc).first.try(:brand).try(:id)
    end
  end

  def product_name
    if object.franchise
      object.franchise.try(:products).order(price: :asc).first.try(:brand).try(:name)
    else
      object.products.order(price: :asc).first.try(:brand).try(:name)
    end
  end

  def product_price
    if object.franchise
      object.franchise.try(:products).order(price: :asc).first.try(:price).to_f
    else
      object.products.order(price: :asc).first.try(:price).to_f
    end
  end

  def franchise_id
    object.franchise.try(:id)
  end

  def is_franchise
    object.franchise.try(:id) != nil
  end

end
