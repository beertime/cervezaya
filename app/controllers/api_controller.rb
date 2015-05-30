class ApiController < ApplicationController

  # http_basic_authenticate_with name: "admin", password: "secret"

  # The API responds only to JSON
  respond_to :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # default to protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  # Check token
  before_filter :authenticate_user_from_token!

  def default_serializer_options
    { root: false }
  end

  private

    def authenticate_user_from_token!
      user_email = request.headers['X-User-Email']
      user_token = request.headers['X-User-Token']

      admin_user = AdminUser.find_by(email: user_email)

      if admin_user && Devise.secure_compare(admin_user.authentication_token, user_token.to_s)
        sign_in admin_user, store: false
      else
        render json: { 'error': 'You need a token before continuing' }, status: 401
      end
    end

end
