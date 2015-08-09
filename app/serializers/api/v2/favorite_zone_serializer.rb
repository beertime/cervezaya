class API::V2::FavoriteZoneSerializer < ActiveModel::Serializer

  attributes :id

  has_one :zone
  has_one :user

end
