class API::RankingsController < ApplicationController

  def index
    render json: Rank.all, status: 200
  end

  def create
    recent = Rank.new(create_recent_params)
    if recent.save
      render json: recent, status: 201
    else
      render json: { errors: recent.errors }, status: 422
    end
  end

  private

    def create_recent_params
      params.permit(:bar_id, :user_id)
    end

end
