class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource, store: false)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: 'Signed up successfully.',
        token: jwt_token,
        token_type: 'Bearer',
        user: user_payload(resource)
      }, status: :created
    else
      render json: {
        message: 'Sign up failed.',
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
  end

  def user_payload(user)
    {
      id: user.id,
      name: user.name,
      email: user.email,
      bio: user.bio
    }
  end

  def jwt_token
    request.env['warden-jwt_auth.token']
  end
end
