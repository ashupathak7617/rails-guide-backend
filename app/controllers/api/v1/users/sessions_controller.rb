class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def auth_options
    super.merge(store: false)
  end

  def respond_with(resource, _opts = {})
    render json: {
      message: 'Signed in successfully.',
      token: jwt_token,
      token_type: 'Bearer',
      user: user_payload(resource)
    }, status: :ok
  end

  def respond_to_on_destroy
    render json: {
      message: 'Signed out successfully.'
    }, status: :ok
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
