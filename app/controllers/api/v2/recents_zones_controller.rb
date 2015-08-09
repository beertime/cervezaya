class API::V2::RecentsZonesController < ApplicationController

  # GET /users/:user_id/recents_zones
  def index
    recents = RecentZone.select('id, zone_id, user_id').where(user_id: params[:user_id])
    render json: recents, status: 200
  end

  # POST /users/:user_id/recents_zones
  def create
    user = User.find(params[:user_id])
    recent = user.recentszones.build(create_recent_params)
    if recent.save
      render json: recent, status: 201
    else
      render json: { errors: recent.errors }, status: 422
    end
  end

  private

    def create_recent_params
      params.permit(:zone_id)
    end

end
