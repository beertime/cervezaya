class BrandSerializer < ActiveModel::Serializer

  attributes :id, :name, :color,
    :image, :image_alt, :image_shadow

  def image
    object.image.url
  end

  def image_alt
    object.alt_image.url
  end

  def image_shadow
    object.shadow_image.url
  end

end
