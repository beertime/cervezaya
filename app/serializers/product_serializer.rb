class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :brand_name, :brand_color, :size_icon,
    :image_small, :image_medium, :image_large,
    :image_alt_small, :image_alt_medium, :image_alt_large,
    :image_shadow_small, :image_shadow_medium, :image_shadow_large

  def brand_name
    object.brand.try(:name)
  end

  def brand_color
    object.brand.try(:color)
  end

  def image_small
    object.brand.try(:image).try(:small).try(:image).try(:url)
  end

  def image_medium
    object.brand.try(:image).try(:medium).try(:image).try(:url)
  end

  def image_large
    object.brand.try(:image).try(:large).try(:image).try(:url)
  end

  def image_alt_small
    object.brand.try(:alt_image).try(:small).try(:image).try(:url)
  end

  def image_alt_medium
    object.brand.try(:alt_image).try(:medium).try(:image).try(:url)
  end

  def image_alt_large
    object.brand.try(:alt_image).try(:large).try(:image).try(:url)
  end

  def image_shadow_small
    object.brand.try(:shadow_image).try(:small).try(:image).try(:url)
  end

  def image_shadow_medium
    object.brand.try(:shadow_image).try(:medium).try(:image).try(:url)
  end

  def image_shadow_large
    object.brand.try(:shadow_image).try(:large).try(:image).try(:url)
  end

  def size_icon
    object.size.try(:icon)
  end
end
