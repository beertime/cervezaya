class SizeSerializer < ActiveModel::Serializer
  cache key: 'sizes', expires_in: 1.day
  attributes :id, :icon, :volume
end
