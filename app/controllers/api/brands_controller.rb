class API::BrandsController < ApplicationController

  # GET /brands/:id
  def index
    render json: Brand.where(published: true), status: 200
  end

end
