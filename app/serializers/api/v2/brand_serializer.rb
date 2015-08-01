class API::V2::BrandSerializer < ActiveModel::Serializer

  attributes :id, :name, :color, :image, :alt_image, :shadow_image

  def image
    object.image_identifier
  end

  def alt_image
    object.alt_image_identifier
  end

  def shadow_image
    object.shadow_image_identifier
  end

end
