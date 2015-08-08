class API::V2::ContactsController < ApiController

  # POST /users
  def create
    user = User.find(params[:user_id])
    contact = user.contacts.build(contact_params)
    if contact.save
      render json: contact, status: 201
    else
      render json: { errors: contact.errors }, status: 422
    end
  end

  private

    def contact_params
      params.permit(:message, :user_id)
    end

end
