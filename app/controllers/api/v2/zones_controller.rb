class API::V2::ZonesController < ApiController

  include Geokit::Geocoders

  # GET /zones
  def index
    zones = Zone.select("id, name, geometry, city, country, image, published").all
      .where(published: true).order(:name)
    if params.has_key?(:city)
      zones = zones.where(city: params[:city])
      logger.debug zones.size
    elsif params.has_key?(:latitude) and params.has_key?(:longitude)
      location = GoogleGeocoder.reverse_geocode([params[:latitude], params[:longitude]].join(','))
      zones = zones.where(city: location.city)
    else
      location = IpGeocoder.geocode(request.remote_ip)
      zones = zones.where(city: location.city)
    end
    render json: zones, status: 200, each_serializer: API::V2::ZoneSerializer, root: false
  end

end
