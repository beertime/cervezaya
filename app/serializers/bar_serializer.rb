class BarSerializer < ActiveModel::Serializer

  attributes :id, :name, :address, :region, :phone, :rank, :latitude, :longitude,
    :photo_small, :photo_medium, :photo_large,
    :user_favorite, :user_rank,
    :product_name, :product_price,
    :product_image_small, :product_image_medium, :product_image_large

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
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

  def user_favorite
    false
  end

  def user_rank
    0
  end

  def product_image_small
    object.products.first.try(:brand).try(:image).try(:small).try(:image).try(:url)
  end

  def product_image_medium
    object.products.first.try(:brand).try(:image).try(:medium).try(:image).try(:url)
  end

  def product_image_large
    object.products.first.try(:brand).try(:image).try(:large).try(:image).try(:url)
  end

  def product_name
    object.products.first.try(:brand).try(:name)
  end

  def product_price
    object.products.first.try(:price)
  end

end
