class BarSerializer < ActiveModel::Serializer

  attributes :id, :name, :description,
    :photo_small, :photo_medium, :photo_large, :address, :phone, :rank,
    :latitude, :longitude, :favorite, :product_image_small,
    :product_image_medium, :product_image_large, :product_name, :product_price

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def favorite
    false
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

  def product_image_small
    # "#{object.products.joins(:brand).first.brand.image.small}"
  end

  def product_image_medium
    # "#{object.products.joins(:brand).first.brand.image.medium}"
  end

  def product_image_large
    # "#{object.products.joins(:brand).first.brand.image.large}"
  end

  def product_name
    # object.products.joins(:brand).first.brand.name
  end

  def product_price
    0
  end

end
