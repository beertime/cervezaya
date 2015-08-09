class API::V2::FavoriteBrandSerializer < ActiveModel::Serializer

  attributes :id

  has_one :brand
  has_one :user

end
