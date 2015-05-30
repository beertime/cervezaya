class API::BarsController < ApiController

  # GET /bars
  def index
    limit = params.has_key?(:limit) ? params[:limit] : 25
    offset = params.has_key?(:offset) ? params[:offset] : 0
    distance = params.has_key?(:distance) ? params[:distance] : 10
    min_distance = params.has_key?(:min_distance) ? params[:min_distance].to_f : nil
    max_distance = params.has_key?(:max_distance) ? params[:max_distance].to_f : nil

    # User match
    Bar.set_user(params[:user_id])

    # Limit and offset
    bars = Bar.limit(limit).offset(offset)

    # Query search
    if params.has_key?(:q)
      bars = bars.where("name ILIKE '%#{params[:q]}%' OR address ILIKE '%#{params[:q]}%'")
    end

    # Filters
    if params.has_key?(:min_price) or params.has_key?(:max_price)
      bars = bars.where_min_max_price(params[:min_price] || nil, params[:max_price] || nil)
    end

    if params.has_key?(:brand_ids)
      bars = bars.filter_by_brands(params[:brand_ids])
    end

    if params.has_key?(:sizes_id)
      bars = bars.filter_by_sizes(params[:sizes_id])
    end

    if params.has_key?(:icons)
      bars = bars.filter_by_icons(params[:icons])
    end

    # Sort
    if params.has_key?(:sort) and /rank|price/.match(params[:sort])
      if params[:sort] == 'rank'
        bars = bars.sort_by_rank()
      elsif params[:sort] == 'price'
        bars = bars.sort_by_price()
      end
    end

    # Always show published bars
    bars = bars.where(published: true)

    # Georeference
    if params.has_key?(:latitude) and params.has_key?(:longitude)
      near_bars = bars.near([params[:latitude], params[:longitude]], max_distance || distance, order: 'distance').to_a
      if min_distance
        bars = near_bars.keep_if { |bar| bar.distance.to_f >= min_distance }
      else
        bars = near_bars
      end
    end

    render json: bars, status: 200
  end

  # GET /bars/:id
  def show
    Bar.set_user(params[:user_id])
    render json: Bar.find(params[:id]), status: 200, serializer: BarDetailSerializer
  end

end
