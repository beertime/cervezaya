class ApiController < ApplicationController

  # The API responds only to JSON
  respond_to :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # default to protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def default_serializer_options
    { root: false }
  end

end
