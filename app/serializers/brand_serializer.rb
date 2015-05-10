class BrandSerializer < ActiveModel::Serializer

  attributes :id, :name, :color, :image_small, :image_medium, :image_large

  has_many :types

  def image_small
    "#{object.image.small}"
  end

  def image_medium
    "#{object.image.medium}"
  end

  def image_large
    "#{object.image.large}"
  end

end
