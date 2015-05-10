class API::BarsController < ApplicationController

  def index
    offset = (params[:offset] || 0).to_i
    limit = (params[:limit] || 25).to_i
    bars = Bar.limit(limit).offset(offset).where(published: true)
    render json: bars, status: 200
  end

end
