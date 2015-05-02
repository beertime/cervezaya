class API::TypesController < ApplicationController

  def index
    render json: Type.all, status: 200
  end

end
