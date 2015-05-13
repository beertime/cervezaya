class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_one :bar
end
