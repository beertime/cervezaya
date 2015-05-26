class API::BarsController < ApplicationController

  # GET /bars
  def index
    limit = params.has_key?(:limit) ? params[:limit] : 25
    offset = params.has_key?(:offset) ? params[:offset] : 0
    distance = params.has_key?(:distance) ? params[:distance] : 10

    # User match
    Bar.set_user(params[:user_id])

    # Limit and offset
    bars = Bar.limit(limit).offset(offset)

    # Georeference
    if params.has_key?(:latitude) and params.has_key?(:longitude)
      bars = bars.near([params[:latitude], params[:longitude]], distance)
    end

    # # Query search
    if params.has_key?(:q)
      bars = bars.where("name LIKE '%#{params[:q]}%'")
    end

    # # Sort
    if params.has_key?(:sort) and /rank|price/.match(params[:sort])
      if params[:sort] == 'rank'
        bars = bars.sort_by_rank()
      elsif params[:sort] == 'price'
        bars = bars.sort_by_price()
      end
    end

    render json: bars.where(published: true), status: 200
  end

  # GET /bars/:id
  def show
    Bar.set_user(params[:user_id])
    render json: Bar.find(params[:id]), status: 200, serializer: BarDetailSerializer
  end

end
