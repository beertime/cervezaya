class API::BrandsController < ApplicationController

  def index
    render json: Brand.where(published: true), status: 200
  end

end
