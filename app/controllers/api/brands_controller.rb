class API::BrandsController < ApiController

  # GET /brands/:id
  def index
    brands = Brand.select("id, name, color, image, alt_image, shadow_image").all
    render json: brands, status: 200
  end

end
