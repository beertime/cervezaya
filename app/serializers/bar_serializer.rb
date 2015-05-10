class BarSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :photo, :address, :phone, :rank, :latitude, :longitude, :favorite

  def favorite
    false
  end
end
