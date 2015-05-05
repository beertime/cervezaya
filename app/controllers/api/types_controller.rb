class API::TypesController < ApplicationController

  def index
    render json: Type.where(published: true), status: 200
  end

end
