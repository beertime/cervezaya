class API::V2::ZoneSerializer < ActiveModel::Serializer

  attributes :id, :name, :geometry, :city, :country, :published

end
