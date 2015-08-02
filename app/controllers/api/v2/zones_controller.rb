class API::V2::ZonesController < ApplicationController

  # GET /zones/:id
  def index
    zones = Zone.select("id, name, geometry, city, country").all
      .where(published: true).order(:name)
    render json: zones, status: 200
  end

end
