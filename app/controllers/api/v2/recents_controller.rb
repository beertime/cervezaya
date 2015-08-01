class API::V2::RecentsController < ApiController

  # GET /users/:user_id/recents
  def index
    recents = Recent.select('id, bar_id, user_id').where(user_id: params[:user_id])
    render json: recents, status: 200
  end

  # POST /users/:user_id/recents
  def create
    user = User.find(params[:user_id])
    recent = user.recents.build(create_recent_params)
    if recent.save
      render json: recent, status: 201
    else
      render json: { errors: recent.errors }, status: 422
    end
  end

  private

    def create_recent_params
      params.permit(:bar_id)
    end

end
