class API::V2::ZoneSerializer < ActiveModel::Serializer

  attributes :id, :name, :geometry, :city, :country, :published, :image

  def image
    object.image_identifier
  end

end
