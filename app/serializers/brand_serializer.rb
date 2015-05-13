class BrandSerializer < ActiveModel::Serializer

  attributes :id, :name, :color, :image_small, :image_medium, :image_large,
    :image_alt_small, :image_alt_medium, :image_alt_large,
    :image_shadow_small, :image_shadow_medium, :image_shadow_large

  def image_small
    object.image.small.try(:image)
  end

  def image_medium
    object.image.medium.try(:image)
  end

  def image_large
    object.image.large.try(:image)
  end

  def image_alt_small
    object.alt_image.small.try(:image)
  end

  def image_alt_medium
    object.alt_image.medium.try(:image)
  end

  def image_alt_large
    object.alt_image.large.try(:image)
  end

  def image_shadow_small
    object.shadow_image.small.try(:image)
  end

  def image_shadow_medium
    object.shadow_image.medium.try(:image)
  end

  def image_shadow_large
    object.shadow_image.large.try(:image)
  end

end
