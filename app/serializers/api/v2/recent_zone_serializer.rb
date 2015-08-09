class API::V2::RecentZoneSerializer < ActiveModel::Serializer

  attributes :id

  has_one :zone
  has_one :user

end
