class API::V2::BrandsController < ApiController

  # GET /brands/:id
  def index
    brands = Brand.all
    if params.has_key?(:types_ids)
      brands = brands.includes(:types).where('brands_types.type_id': params[:types_ids])
    end
    brands = brands.where(published: true).order(:name)
    render json: brands, status: 200
  end

end
