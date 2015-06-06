class API::SizesController < ApiController

  # GET /sizes
  def index
    render json: Size.select("id, name, icon, volume").all, status: 200
  end

end
