class API::V2::ProductSerializer < ActiveModel::Serializer

  attributes :id, :price

  has_one :size
  has_one :brand

end
