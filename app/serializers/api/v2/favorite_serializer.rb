class API::V2::FavoriteSerializer < ActiveModel::Serializer
  
  attributes :id

  has_one :bar
  has_one :user

end
