class TypeSerializer < ActiveModel::Serializer
  cache key: 'types', expires_in: 1.day
  attributes :id, :name
end
