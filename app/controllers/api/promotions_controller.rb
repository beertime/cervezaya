class API::PromotionsController < ApiController

  # GET /promotions
  def index
    date = params[:date]
    start_date = params[:start_date] || Time.now.to_date
    end_date = params[:end_date]

    if !date.blank?
      promotions = Promotion.where('start_date <= ?', date)
        .where('end_date >= ?', date)
    elsif !end_date.blank?
      promotions = Promotion.where('start_date <= ?', start_date)
        .where('end_date >= ?', end_date)
    else
      promotions = Promotion.where('start_date <= ?', start_date)
    end

    render json: promotions, status: 200
  end

end
