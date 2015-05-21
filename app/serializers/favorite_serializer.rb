class FavoriteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :bar
end
