class API::V2::BarSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo
  has_many :products
  has_one :franchise
end
