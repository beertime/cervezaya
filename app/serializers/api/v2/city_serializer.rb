class API::V2::CitySerializer < ActiveModel::Serializer

  attributes :id, :iso_country_code, :name

end
