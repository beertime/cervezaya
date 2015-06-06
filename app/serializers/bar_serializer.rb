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
    unless object.photo_identifier.blank?
      object.photo_identifier
    else
      object.franchise.try(:photo_identifier)
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
      products = object.franchise.try(:products)
    else
      products = object.products
    end
    products.get_cheapest(serialization_options[:min_price], serialization_options[:max_price])
      .try(:brand).try(:image_identifier)
  end

  def product_brand_id
    if object.franchise
      products = object.franchise.try(:products)
    else
      products = object.products
    end
    products.get_cheapest(serialization_options[:min_price], serialization_options[:max_price])
      .try(:brand).try(:id)
  end

  def product_name
    if object.franchise
      products = object.franchise.try(:products)
    else
      products = object.products
    end
    products.get_cheapest(serialization_options[:min_price], serialization_options[:max_price])
      .try(:brand).try(:name)
  end

  def product_price
    if object.franchise
      products = object.franchise.try(:products)
    else
      products = object.products
    end
    products.get_cheapest(serialization_options[:min_price], serialization_options[:max_price])
      .try(:price).to_f
  end

  def franchise_id
    object.franchise.try(:id)
  end

  def is_franchise
    object.franchise.try(:id) != nil
  end

end
