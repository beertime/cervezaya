class API::V2::RankSerializer < ActiveModel::Serializer

  attributes :id

  has_one :bar
  has_one :user

end
