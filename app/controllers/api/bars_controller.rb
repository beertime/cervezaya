class API::BarsController < ApiController

  # GET /bars
  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 25
    offset = params.has_key?(:offset) ? params[:offset].to_i : 0
    min_distance = params.has_key?(:min_distance) ? params[:min_distance].to_f : nil
    max_distance = params.has_key?(:max_distance) ? params[:max_distance].to_f : nil
    min_price = params.has_key?(:min_price) ? params[:min_price].to_f : nil
    max_price = params.has_key?(:max_price) ? params[:max_price].to_f : nil
    is_sorted = params.has_key?(:sort) and /rank|price/.match(params[:sort])

    # User match
    Bar.set_user(params[:user_id])

    # Limit and offset
    bars = Bar.includes(:products).limit(limit).offset(offset)

    Query search
    if params.has_key?(:q)
      bars = bars.where("name ILIKE '%#{params[:q]}%' OR address ILIKE '%#{params[:q]}%'")
    end

    Filters
    if min_price or max_price
      bars = bars.where_min_max_price(min_price || 0, max_price || nil)
    end

    if params.has_key?(:brands_ids)
      bars = bars.filter_by_brands(params[:brands_ids])
    end

    if params.has_key?(:sizes_id)
      bars = bars.filter_by_sizes(params[:sizes_id])
    end

    if params.has_key?(:types_ids)
      bars = bars.filter_by_types(params[:types_ids])
    end

    if params.has_key?(:icons)
      bars = bars.filter_by_icons(params[:icons])
    end

    # Georeference
    if params.has_key?(:latitude) and params.has_key?(:longitude)
      bars = bars.filter_by_lat_lng([params[:latitude].to_f, params[:longitude].to_f], min_distance, max_distance, !is_sorted)
    end

    # Sort
    if is_sorted
      if params[:sort] == 'rank'
        bars = bars.sort_by_rank()
      elsif params[:sort] == 'price'
        bars = bars.sort_by_price()
      end
    end

    render json: bars, status: 200, min_price: min_price, max_price: max_price
  end

  # GET /bars/:id
  def show
    Bar.set_user(params[:user_id])
    render json: Bar.find(params[:id]), status: 200, serializer: BarDetailSerializer
  end

end
