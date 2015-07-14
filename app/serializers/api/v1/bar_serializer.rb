class API::V1::BarSerializer < ActiveModel::Serializer

  cached

  attributes :id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo,
    :product_brand_id, :product_name, :product_price, :product_image,
    :user_favorite, :user_rank, :user_rank_id,
    :franchise_id, :is_franchise

  def cache_key
    [object, scope]
  end

  def address
    "#{object.address.split(', ')[0]}, #{object.address.split(', ')[1]}"
  end

  def rank
    object.rank || 0
  end

  def photo
    unless object.photo_identifier.blank?
      object.photo_identifier
    else
      object.franchise.try(:photo_identifier)
    end
  end

  def product_brand_id
    products = get_products
    products.first.try(:brand_id)
  end

  def product_name
    products = get_products
    products.first.try(:brand).try(:name)
  end

  def product_price
    products = get_products
    products.first.try(:price).to_f
  end

  def product_image
    products = get_products
    products.first.try(:brand).try(:shadow_image_identifier)
  end

  def user_favorite
    !Favorite.get_by_user_and_bar(serialization_options[:user], object.id).nil?
  end

  def user_rank_id
    Rank.get_by_user_and_bar(serialization_options[:user], object.id).try(:id)
  end

  def user_rank
    Rank.get_by_user_and_bar(serialization_options[:user], object.id).try(:value) or 0
  end

  def franchise_id
    object.franchise ? object.franchise.id : nil
  end

  def is_franchise
    !object.franchise.nil?
  end

  private

    def get_products
      products = object.franchise.nil? ? object.products : object.franchise.try(:products)
      # if serialization_options[:min_price]
      #   products = products.where('price >= ?', serialization_options[:min_price])
      # end
      if serialization_options[:max_price]
        products = products.where('price <= ?', serialization_options[:max_price])
      end
      products
    end

end
