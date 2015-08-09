class API::V2::FavoritesZonesController < ApplicationController

  # GET /users/:user_id/favorites_zones
  def index
    favorites = FavoriteZone.select('id, zone_id, user_id')
      .where(user_id: params[:user_id])
    render json: favorites, status: 200
  end

  # POST /users/:user_id/favorites_zones
  def create
    user = User.find(params[:user_id])
    favorite = user.favorites_zones.build(create_favorite_params)
    favorite_exists = FavoriteZone.where(user_id: params[:user_id], zone_id: params[:zone_id])
    if favorite_exists.size > 0
      render json: favorite_exists.take!, status: 200
    else
      if favorite.save
        render json: favorite, status: 201
      else
        render json: { errors: favorite.errors }, status: 422
      end
    end
  end

  # DELETE /users/:user_id/favorites_zones/:id
  def destroy
    user = User.find(params[:user_id])
    if defined?(user)
      favorite = user.favorites_zones.size > 0 ? user.favorites_zones.find(params[:id]) : nil
    end
    if favorite
      favorite.destroy
      head 204
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

    def create_favorite_params
      params.permit(:zone_id)
    end

end
