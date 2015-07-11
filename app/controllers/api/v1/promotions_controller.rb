class API::V1::PromotionsController < ApiController

  # GET /promotions
  def index
    date = params[:date]
    start_date = params[:start_date] || Time.now.to_date
    end_date = params[:end_date]

    current_user = params.has_key?(:user_id) ? User.select('id').find(params[:user_id]) : nil

    promotions = Promotion.all

    if !date.blank?
      wday = date.to_date.strftime("%A").downcase
      promotions = promotions.where('start_date <= ?', date)
        .where('end_date >= ?', date).where("#{wday} = TRUE")
    elsif !end_date.blank?
      promotions = promotions.where('start_date <= ?', start_date)
        .where('end_date >= ?', end_date)
    else
      promotions = promotions.where('start_date <= ?', start_date)
        .where('end_date >= ?', Date.today)
    end

    render json: promotions.where(published: true), status: 200, date: date || start_date, user: current_user
  end

end
