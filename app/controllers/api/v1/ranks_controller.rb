class API::V1::RanksController < ApiController

  # GET /users/:user_id/ranks/:id
  def show
    rank = Rank.select('id, value, bar_id, user_id').where(user_id: params[:user_id], id: params[:id]).take!
    render json: rank, status: 200
  end

  # POST /users/:user_id/ranks
  def create
    user = User.find(params[:user_id])
    rank = user.ranks.build(create_rank_params)
    Bar.update_rank(params[:bar_id], params[:value])
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
