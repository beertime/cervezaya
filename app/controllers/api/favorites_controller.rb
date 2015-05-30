class API::FavoritesController < ApiController

  # GET /users/:user_id/favorites
  def index
    user = User.find(params[:user_id])
    favorites = user.favorites.order('updated_at DESC')
    render json: favorites, status: 200
  end

  # POST /users/:user_id/favorites
  def create
    user = User.find(params[:user_id])
    favorite = user.favorites.build(create_favorite_params)
    if favorite.save
      render json: favorite, status: 201
    else
      render json: { errors: favorite.errors }, status: 422
    end
  end

  # DELETE /users/:user_id/favorites/:id
  def destroy
    user = User.find(params[:user_id])
    favorite = user.favorites.find(params[:id])
    favorite.destroy
    head 204
  end

  private

    def create_favorite_params
      params.permit(:bar_id)
    end

end
