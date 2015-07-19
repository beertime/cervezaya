class ApplicationController < ActionController::Base

  include SSLWithConfiguredPort

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  force_ssl_with_configured_port if: :use_ssl?

  def use_ssl?
    Rails.application.config.try(:use_ssl).is_a?(TrueClass)
  end

end
