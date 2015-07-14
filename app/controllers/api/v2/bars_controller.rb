class API::V2::BarsController < ApiController

  # GET /bars
  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 25
    offset = params.has_key?(:offset) ? params[:offset].to_i : 0

    bars = Bar.all
    # Pagination
    bars = bars.offset(offset).limit(limit)

    render json: bars.where(published: true), status: 200
  end

  # GET /bars/:id
  def show
    render json: Bar.find(params[:id]), status: 200
  end

end
