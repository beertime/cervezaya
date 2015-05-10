class BrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :image
  has_many :types
end
