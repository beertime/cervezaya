class API::V2::FavoritesBrandsController < ApplicationController

  # GET /users/:user_id/favorites_brands
  def index
    favorites = FavoriteBrand.select('id, brand_id, user_id')
      .where(user_id: params[:user_id])
    render json: favorites, status: 200
  end

  # POST /users/:user_id/favorites_brands
  def create
    user = User.find(params[:user_id])
    favorite = user.favorites_brands.build(create_favorite_params)
    favorite_exists = FavoriteBrand.where(user_id: params[:user_id], brand_id: params[:brand_id])
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

  # DELETE /users/:user_id/favorites_brands/:id
  def destroy
    user = User.find(params[:user_id])
    if defined?(user)
      favorite = user.favorites_brands.size > 0 ? user.favorites_brands.find(params[:id]) : nil
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
      params.permit(:brand_id)
    end

end
