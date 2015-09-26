class API::V2::ZoneSerializer < ActiveModel::Serializer

  attributes :id, :name, :geometry, :city, :country, :published, :image, :bars_count

  def image
    object.image_identifier
  end

  def bars_count
    Bar.zones_count(object.id)
  end

end
