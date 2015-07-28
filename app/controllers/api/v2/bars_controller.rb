class API::V2::BarsController < ApiController

  # GET /bars
  def index
    min_price = params.has_key?(:min_price) ? params[:min_price].to_f : nil
    max_price = params.has_key?(:max_price) ? params[:max_price].to_f : nil

    limit = params.has_key?(:limit) ? params[:limit].to_i : 25
    offset = params.has_key?(:offset) ? params[:offset].to_i : 0

    current_user = params.has_key?(:user_id) ? User.select('id').find(params[:user_id]) : nil

    bars = Bar.all

    # Filters
    # params: latitude, longitude
    bars = bars.filter_by_params(params)

    # Sort by rank, price or distance params
    # params: sort, latitude, longitude
    bars = bars.sort_by_params(params)

    # Pagination
    bars = bars.offset(offset).limit(limit)

    render json: bars.where(published: true), each_serializer: API::V2::BarSerializer, status: 200, user: current_user, min_price: min_price, max_price: max_price
  end

  # GET /bars/:id
  def show
    render json: Bar.find(params[:id]), status: 200
  end

end