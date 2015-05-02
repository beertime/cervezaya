class API::SizesController < ApplicationController

  def index
    render json: Size.all, status: 200
  end

end
