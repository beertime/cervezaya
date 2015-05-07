class API::SizesController < ApplicationController

  def index
    render json: Size.where(published: true), status: 200
  end

end
