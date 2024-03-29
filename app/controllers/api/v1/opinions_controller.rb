class API::V1::OpinionsController < ApiController

  # GET /bars/:bar_id/opinions
  def index
    opinions = Opinion.select("id, comment, user_id, created_at")
      .where(bar_id: params[:bar_id])
      .where(published: true)
    render json: opinions, status: 200
  end

  # POST /bars/:bar_id/opinions
  def create
    bar = Bar.find(params[:bar_id])
    opinion = bar.opinions.build(create_opinion_params)
    if opinion.save
      render json: opinion, status: 201
    else
      render json: { errors: opinion.errors }, status: 422
    end
  end

  private

    def create_opinion_params
      params.permit(:comment, :published, :user_id)
    end

end
