class BarSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :photo, :address, :phone, :rank, :latitude, :longitude, :favorite
  has_many :products
  def favorite
    false
  end
end
