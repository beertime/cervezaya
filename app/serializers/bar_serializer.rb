class BarSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :address, :phone, :rank, :latitude, :longitude
end
