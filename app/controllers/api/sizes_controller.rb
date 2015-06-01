class API::SizesController < ApiController

  # GET /sizes
  def index
    render json: Size.where(published: true), status: 200
  end

end
