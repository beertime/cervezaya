class API::PromotionsController < ApiController

  # GET /promotions
  def index
    date = params[:date]
    start_date = params[:start_date] || Time.now.to_date
    end_date = params[:end_date]

    # promotions = Promotion.select('id, title, description, image, start_date, end_date, start_hour, end_hour, recurrent, bar_id')
    promotions = Promotion.all

    if !date.blank?
      day_of_week = date.to_date.strftime("%A").downcase
      promotions = promotions.where('start_date <= ?', date)
        .where('end_date >= ?', date).where("#{day_of_week} = TRUE")
    elsif !end_date.blank?
      promotions = promotions.where('start_date <= ?', start_date)
        .where('end_date >= ?', end_date)
    else
      promotions = promotions.where('start_date <= ?', start_date)
        .where('end_date >= ?', Date.today)
    end

    promotions = promotions.where(published: true)

    render json: promotions, status: 200, date: date || Date.today
  end

end
