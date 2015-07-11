class API::V1::TypesController < ApiController

  # GET /types
  def index
    types = Type.select("id, name").all.where(published: true)
    render json: types, status: 200
  end

end
