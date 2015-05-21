class API::BarsController < ApplicationController

  # GET /bars
  def index
    offset = (params[:offset] || 0).to_i
    limit = (params[:limit] || 25).to_i
    distance = params[:distance] || 1

    bars = Bar.limit(limit).offset(offset)

    # Georeference
    unless params[:latitude].blank? and params[:longitude].blank?
      bars = bars.near([params[:latitude], params[:longitude]], distance)
    end

    # Query search
    if params[:q]
      bars = bars.where("name LIKE '%#{params[:q]}%'")
    end

    # User match
    if params[:user_id]
      bars.set_user(params[:user_id] || nil)
    end
    # unless params[:min_price].blank?
    #   bars.where(published: true)
    # end

    # Sort
    if params[:sort] == 'rank'
      bars.sort_by { |b| b.rank.to_i }
    elsif params[:sort] == 'price'
      bars.sort_by { |b| b.products.first.try(:price).to_i }
    end

    render json: bars, status: 200
  end

  # GET /bars/:id
  def show
    if params[:user_id]
      Bar.set_user(params[:user_id])
    end
    render json: Bar.find(params[:id]), status: 200, serializer: BarDetailSerializer
  end

end
