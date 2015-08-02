class API::V2::ZonesController < ApplicationController

  # GET /zones
  def index
    zones = Zone.select("id, name, geometry, city, country, published").all
      .where(published: true).order(:name)
    if params.has_key?(:city)
      zones = zones.where(city: params[:city])
    end
    render json: zones, status: 200, each_serializer: API::V2::ZoneSerializer, root: false
  end

end
