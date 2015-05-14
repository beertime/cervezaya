class API::UsersController < ApplicationController

  respond_to :json

  # GET /users/:id
  def show
    render json: User.find(params[:id]), status: 200
  end

  # POST /users
  def create
    user = User.new(create_user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # PUT /users/:id
  def update
    user = User.find(params[:id])

    if user.update(update_user_params)
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

    def create_user_params
      params.permit(:uid, :publicname, :firstname, :lastname, :username, :email, :password, :password_confirmation, :birth, :city, :country, :phone, :avatar, :gender, :active)
    end

    def update_user_params
      params.permit(:publicname, :firstname, :lastname, :username, :email, :password, :password_confirmation, :birth, :city, :country, :phone, :avatar, :gender, :active)
    end

end
