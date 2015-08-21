class API::V2::BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank,
    :latitude, :longitude, :photo, :user_favorite, :user_rank

  has_many :products
  has_one :franchise

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def photo
    object.photo_identifier
  end

  def user_favorite
    !Favorite.get_by_user_and_bar(serialization_options[:user], object.id).nil?
  end

  def user_rank
    Rank.get_by_user_and_bar(serialization_options[:user], object.id).try(:value) or 0
  end

end
