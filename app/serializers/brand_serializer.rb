class BrandSerializer < ActiveModel::Serializer

  attributes :id, :name, :color, :image, :image_alt, :image_shadow

  def image
    object.image_identifier unless object.image_identifier.blank?
  end

  def image_alt
    object.alt_image_identifier unless object.alt_image_identifier.blank?
  end

  def image_shadow
    object.shadow_image_identifier unless object.shadow_image_identifier.blank?
  end

end
