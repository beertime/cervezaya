class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :brand_name, :brand_color, :size_icon,
    :image_small, :image_medium, :image_large,
    :image_alt_small, :image_alt_medium, :image_alt_large,
    :image_shadow_small, :image_shadow_medium, :image_shadow_large

  def brand_name
    object.brand.name
  end

  def brand_color
    object.brand.color
  end

  def image_small
    "#{object.brand.image.small}"
  end

  def image_medium
    "#{object.brand.image.medium}"
  end

  def image_large
    "#{object.brand.image.large}"
  end

  def image_alt_small
    "#{object.brand.image.small}"
  end

  def image_alt_medium
    "#{object.brand.image.medium}"
  end

  def image_alt_large
    "#{object.brand.image.large}"
  end

  def image_shadow_small
    "#{object.brand.image.small}"
  end

  def image_shadow_medium
    "#{object.brand.image.medium}"
  end

  def image_shadow_large
    "#{object.brand.image.large}"
  end

  def size_icon
    object.size.icon
  end
end
