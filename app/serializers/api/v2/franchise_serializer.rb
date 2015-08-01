class API::V2::FranchiseSerializer < ActiveModel::Serializer

  attributes :id, :name, :photo

  has_many :products

  def photo
    object.photo_identifier
  end

end
