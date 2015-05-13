class API::RecentsController < ApplicationController

  def index
    render json: Recent.all, status: 200
  end

  def create
    recent = Recent.new(create_recent_params)
    if recent.save
      render json: recent, status: 201
    else
      render json: { errors: recent.errors }, status: 422
    end
  end

  def destroy
    recent = Recent.find(params[:id])
    recent.destroy
    head 204
  end

  private

    def create_recent_params
      params.permit(:bar_id, :user_id)
    end

end
