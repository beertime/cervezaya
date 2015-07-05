class FavoriteSerializer < ActiveModel::Serializer
  attributes :favorite_id, :id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :user_favorite, :user_rank, :user_rank_id,
    :product_name, :product_price, :product_image, :franchise_id, :is_franchise

  def favorite_id
    object.id
  end

  def id
    object.bar_id
  end

  def name
    object.bar.try(:name)
  end

  def address
    address = object.bar.try(:address)
    "#{address.split(',')[0]}, #{address.split(',')[1]}"
  end

  def region
    object.bar.try(:region)
  end

  def phone
    object.bar.try(:phone)
  end

  def rank
    object.bar.try(:rank) || 0
  end

  def latitude
    object.bar.try(:latitude)
  end

  def longitude
    object.bar.try(:longitude)
  end

  def photo
    unless object.bar.try(:photo_identifier).blank?
      object.bar.try(:photo_identifier)
    else
      object.bar.try(:franchise).try(:photo_identifier)
    end
  end

  def product_brand_id
    products = get_products
    products.first.try(:brand_id) if products
  end

  def product_name
    products = get_products
    products.first.try(:brand).try(:name) if products
  end

  def product_price
    products = get_products
    products.first.try(:price).to_f if products
  end

  def product_image
    products = get_products
    products.first.try(:brand).try(:image_identifier) if products
  end

  def user_favorite
    !Favorite.get_by_user_and_bar(object.user_id, object.bar_id).nil?
  end

  def user_rank_id
    Rank.get_by_user_and_bar(object.user_id, object.bar_id).try(:id)
  end

  def user_rank
    Rank.get_by_user_and_bar(object.user_id,object.bar_id).try(:value) or 0
  end

  def franchise_id
    object.bar.try(:franchise) ? object.bar.try(:franchise).id : nil
  end

  def is_franchise
    !object.bar.try(:franchise).nil?
  end

  private

    def get_products
      object.bar.try(:franchise).nil? ? object.bar.try(:products) : object.bar.try(:franchise).try(:products)
    end

end
