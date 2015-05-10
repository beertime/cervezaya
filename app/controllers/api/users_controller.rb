class API::UsersController < ApplicationController

  respond_to :json

  def show
    render User.find(params[:id]), status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end

end
