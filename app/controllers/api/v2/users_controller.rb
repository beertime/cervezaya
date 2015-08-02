class API::V2::UsersController < ApiController

  respond_to :json

  # GET /users/:id
  def show
    render json: User.find(params[:id]), status: 200
  end

  # POST /users
  def create
    unless params[:email]
      render json: { errors: "email is required" }, status: 422
    else
      user = User.where(email: params[:email]).first_or_create
      user.last_connection_date = Time.now unless params.has_key?(:last_connection_date)
      if user.update_attributes(user_params) or defined?(user)
        render json: user, status: 200, location: [:api, user]
      else
        render json: { errors: user.errors }, status: 422
      end
    end
  end

  # PUT /users/:id
  def update
    user = User.find(params[:id])
    user.last_connection_date = Time.now unless params.has_key?(:last_connection_date)
    if user.update_attributes(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # DELETE /users/:id
  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

    def user_params
      params.permit(:push_uid, :facebook_uid, :google_uid, :email, :publicname, :username, :birth, :city, :country, :avatar, :custom_avatar, :gender, :active, :last_connection_date)
    end

end
