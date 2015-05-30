class BarDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :address, :region, :phone, :rank, :latitude, :longitude,
    :user_favorite, :user_favorite_id, :user_rank, :user_rank_id, :products, :is_franchise

  has_many :products

  def is_franchise
    object.franchise.try(:id) != nil
  end

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

  def user_rank
    Bar.get_user_rank(object.id)
  end

  def user_rank_id
    Bar.get_user_rank_id(object.id)
  end

  def user_favorite
    Bar.get_user_favorite(object.id)
  end

  def user_favorite_id
    Bar.get_user_favorite_id(object.id)
  end

end
