class API::V2::CountriesController < ApiController

  # GET /countries
  def index
    countries = ISO3166::Country
    result = countries.all.map do |c|
      { iso: c[1], name: c[0] }
    end
    render json: result
  end

end
