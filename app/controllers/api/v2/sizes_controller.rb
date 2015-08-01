class API::V2::SizesController < ApiController

  # GET /sizes
  def index
    sizes = Size.select("id, name, icon, volume").all.where(published: true)
    render json: sizes, status: 200
  end

end
