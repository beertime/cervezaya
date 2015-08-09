class API::V2::RecentBrandSerializer < ActiveModel::Serializer

  attributes :id

  has_one :brand
  has_one :user

end
