class API::RanksController < ApplicationController

  # GET /users/:user_id/ranks/:id
  def show
    user = User.find(params[:user_id])
    rank = user.ranks.find(params[:id])
    render json: rank, status: 200
  end

  # POST /users/:user_id/ranks
  def create
    user = User.find(params[:user_id])
    rank = user.ranks.build(create_rank_params)
    if rank.save
      render json: rank, status: 201
    else
      render json: { errors: rank.errors }, status: 422
    end
  end

  # PUT /users/:user_id/ranks/:id
  def update
    user = User.find(params[:user_id])
    rank = user.ranks.update_attributes(create_rank_params)
    if rank.save
      render json: rank, status: 200
    else
      render json: { errors: rank.errors }, status: 422
    end
  end

  private

    def create_rank_params
      params.permit(:bar_id, :value)
    end

end
