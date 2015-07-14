class API::V2::SizeSerializer < ActiveModel::Serializer
  attributes :id, :name, :icon, :volume
end
