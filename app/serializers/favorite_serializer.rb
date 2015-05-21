class FavoriteSerializer < ActiveModel::Serializer
  # attributes :id
  embed :ids
  has_one :bar
end
