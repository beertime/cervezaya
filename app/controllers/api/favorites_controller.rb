class API::FavoritesController < ApplicationController

  def index
    render json: Favorite.all, status: 200
  end

  def create
    favorite = Favorite.new(create_favorite_params)
    if favorite.save
      render json: favorite, status: 201
    else
      render json: { errors: favorite.errors }, status: 422
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    head 204
  end

  private

    def create_favorite_params
      params.permit(:bar_id, :user_id)
    end

end
