class API::TypesController < ApiController

  # GET /types
  def index
    render json: Type.where(published: true), status: 200
  end

end
