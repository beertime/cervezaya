class API::V1::BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank, :latitude, :longitude,
    :user_favorite, :user_favorite_id, :user_rank, :user_rank_id, :products, :is_franchise

  has_many :products

  def products
    if object.franchise
      object.franchise.try(:products)
    else
      object.products
    end
  end

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def rank
    object.rank || 0
  end

  def user_rank_id
    Rank.get_by_user_and_bar(serialization_options[:user], object.id).try(:id)
  end

  def user_rank
    Rank.get_by_user_and_bar(serialization_options[:user], object.id).try(:value) or 0
  end

  def user_favorite
    !Favorite.get_by_user_and_bar(serialization_options[:user], object.id).nil?
  end

  def user_favorite_id
    Favorite.get_by_user_and_bar(serialization_options[:user], object.id).try(:id)
  end

  def is_franchise
    !object.franchise.nil?
  end

end
