class API::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :price,
    :brand_id, :brand_name, :brand_color,
    :size_icon, :size_volume,
    :image, :image_alt, :image_shadow

  def price
    object.price.to_f
  end

  def brand_id
    object.brand.id
  end

  def brand_name
    object.brand.try(:name)
  end

  def brand_color
    object.brand.try(:color)
  end

  def brand_icon
    object.s.try(:icon)
  end

  def image
    object.brand.try(:image_identifier)
  end

  def image_alt
    object.brand.try(:alt_image_identifier)
  end

  def image_shadow
    object.brand.try(:shadow_image_identifier)
  end

  def size_icon
    object.size.try(:icon)
  end

  def size_volume
    object.size.try(:volume)
  end

end
