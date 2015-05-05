class API::PromotionsController < ApplicationController

  respond_to :json

  def index
    render json: Promotion.where(published: true), status: 200
  end

end
