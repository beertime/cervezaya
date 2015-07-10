class API::V1::SizeSerializer < ActiveModel::Serializer
  attributes :id, :name, :icon, :volume
end
