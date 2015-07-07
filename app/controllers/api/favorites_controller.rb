class API::FavoritesController < ApiController

  # GET /users/:user_id/favorites
  def index
    favorites = Favorite.select('id, bar_id, user_id')
      .where(user_id: params[:user_id])
    render json: favorites, status: 200
  end

  # POST /users/:user_id/favorites
  def create
    user = User.find(params[:user_id])
    favorite = user.favorites.build(create_favorite_params)
    favorite_exists = Favorite.where(user_id: params[:user_id], bar_id: params[:bar_id])
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

  # DELETE /users/:user_id/favorites/:id
  def destroy
    user = User.find(params[:user_id])
    favorite = user.favorites.find(params[:id])
    if favorite
      favorite.destroy
      head 204
    end
  end

  private

    def create_favorite_params
      params.permit(:bar_id)
    end

end
