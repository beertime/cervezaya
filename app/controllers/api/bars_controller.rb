class API::BarsController < ApplicationController

  # GET /bars
  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 25
    offset = params.has_key?(:offset) ? params[:offset].to_i : 0
    distance = params.has_key?(:distance) ? params[:distance].to_i : 10

    # User match
    Bar.set_user(params[:user_id])

    # Limit and offset
    bars = Bar.limit(limit).offset(offset)

    # Georeference
    if params.has_key?(:latitude) and params.has_key?(:longitude)
      bars = bars.near([params[:latitude].to_f, params[:longitude].to_f], distance)
    end

    # Query search
    if params.has_key?(:q)
      bars = bars.where("name LIKE '%#{params[:q]}%'")
    end

    # Sort
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
    Bar.set_user(params[:user_id] || nil)
    render json: Bar.find(params[:id]), status: 200, serializer: BarDetailSerializer
  end

end
