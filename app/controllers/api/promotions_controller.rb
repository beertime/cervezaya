class API::PromotionsController < ApplicationController

  respond_to :json

  def index
    date = params[:date]
    bar = params[:bar]
    promotions = Promotion.where(published: true)
    unless date.blank?
      promotions = promotions.where('start_date <= ?', date)
        .where('end_date >= ?', date || Time.now.to_date)
    end
    render json: promotions, status: 200
  end

end
