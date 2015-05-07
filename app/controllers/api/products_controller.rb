class API::ProductsController < ApplicationController

  respond_to :json

  def index
    render json: Product.where(published: true), status: 200
  end

  def show
    render json: Product.find(params[:id]), status: 200
  end

end
