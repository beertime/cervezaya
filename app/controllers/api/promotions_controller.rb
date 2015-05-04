class API::PromotionsController < ApplicationController

  respond_to :json

  def index
    render json: Promotion.all, status: 200
  end

end
