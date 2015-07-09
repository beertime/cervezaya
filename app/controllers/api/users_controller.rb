class API::UsersController < ApiController

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
      logger.debug user_params
      if user.update(user_params)
        render json: user, status: 201, location: [:api, user]
      else
        render json: { errors: user.errors }, status: 422
      end
    end
  end

  # PUT /users/:id
  def update
    user = User.find(params[:id])
    if user.update(user_params)
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
      params.require(:email).permit(:push_uid, :facebook_uid, :google_uid, :publicname, :username, :birth, :city, :country, :avatar, :custom_avatar, :gender, :active)
    end

end
