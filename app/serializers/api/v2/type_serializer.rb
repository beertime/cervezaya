class API::V2::TypeSerializer < ActiveModel::Serializer

  attributes :id, :name, :image, :brands_count, :bars_count

  def brands_count
    Type.brands_count(object.id)
  end

  def bars_count
    Bar.types_count(object.id)
  end

  def image
    object.image_identifier
  end

end
