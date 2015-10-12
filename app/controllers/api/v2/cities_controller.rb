class API::V2::CitiesController < ApiController

  # GET /countries
  def index
    cities = City.where(gns_fd: ['PPL', 'PPLA'])
    if params.has_key?(:country)
      cities = cities.where(iso_country_code: params[:country])
    end
    render json: cities, status: 200
  end

end
