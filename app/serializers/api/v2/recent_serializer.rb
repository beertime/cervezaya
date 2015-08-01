class API::V2::RecentSerializer < ActiveModel::Serializer

  attributes :id

  has_one :bar
  has_one :user

end
