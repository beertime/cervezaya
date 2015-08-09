class API::V2::RecentsBrandsController < ApplicationController

  # GET /users/:user_id/recents_brands
  def index
    recents = RecentBrand.select('id, brand_id, user_id').where(user_id: params[:user_id])
    render json: recents, status: 200
  end

  # POST /users/:user_id/recents_brands
  def create
    user = User.find(params[:user_id])
    recent = user.recentsbrands.build(create_recent_params)
    if recent.save
      render json: recent, status: 201
    else
      render json: { errors: recent.errors }, status: 422
    end
  end

  private

    def create_recent_params
      params.permit(:brand_id)
    end

end
