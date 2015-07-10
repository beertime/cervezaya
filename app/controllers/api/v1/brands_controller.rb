class API::V1::BrandsController < ApiController

  # GET /brands/:id
  def index
    brands = Brand.select("id, name, color, image, alt_image, shadow_image").all
      .where(published: true).order(:name)
    render json: brands, status: 200
  end

end
