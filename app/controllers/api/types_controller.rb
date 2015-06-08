class API::TypesController < ApiController

  # GET /types
  def index
    render json: Type.select("id, name").all, status: 200
  end

end
