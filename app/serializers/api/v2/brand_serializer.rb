class API::V2::BrandSerializer < ActiveModel::Serializer

  attributes :id, :name, :color, :image, :alt_image, :shadow_image

end
