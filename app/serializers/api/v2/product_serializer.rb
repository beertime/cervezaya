class API::V2::ProductSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :size
  has_one :brand
    # :brand_id, :brand_name, :brand_color,
    # :size_icon, :size_volume,
    # :image, :image_alt, :image_shadow
end
