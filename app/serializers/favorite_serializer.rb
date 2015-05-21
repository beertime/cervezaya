class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :bar_id, :name, :address, :region, :phone, :rank, :latitude, :longitude, :photo

  def address
    "#{object.address.split(',')[0]}, #{object.address.split(',')[1]}"
  end

  def name
    object.bar.try(:name)
  end

  def address
    object.bar.try(:address)
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
    object.bar.try(:photo).try(:url).to_s.split('/').last
  end

end
