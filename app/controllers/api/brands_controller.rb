class API::BrandsController < ApiController

  # GET /brands/:id
  def index
    render json: Brand.where(published: true), status: 200
  end

end
