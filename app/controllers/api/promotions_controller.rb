class API::PromotionsController < ApplicationController

  respond_to :json

  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    date = params[:date]
    bar = params[:bar]
    promotions = Promotion.where(published: true)

    if !date.blank?
      promotions = promotions.where('start_date <= ?', date)
        .where('end_date >= ?', date)
    elsif !start_date.blank?
      promotions = promotions.where('start_date <= ?', start_date)
        .where('end_date >= ?', end_date || Time.now.to_date)
    end

    render json: promotions, status: 200
  end

end
