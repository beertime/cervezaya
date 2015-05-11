class API::BarsController < ApplicationController

  def index
    offset = (params[:offset] || 0).to_i
    limit = (params[:limit] || 25).to_i
    distance = params[:distance] || 1

    bars = Bar.limit(limit).offset(offset)

    unless params[:latitude].blank? and params[:longitude].blank?
      bars = bars.near([params[:latitude], params[:longitude]], distance)
    end

    # unless params[:price].blank?
    #   bars.where(published: true)
    # else
    #   bars.where(published: true)
    # end

    render json: bars, status: 200
  end

  def show
    render json: Bar.find(params[:id]), status: 200, serializer: BarDetailSerializer
  end

end
