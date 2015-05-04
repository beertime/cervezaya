class API::UsersController < ApplicationController

  respond_to :json

  def index
    render json: User.all, status: 200
  end

  def show
    render json: User.find(params[:id]), status: 200
  end

end
