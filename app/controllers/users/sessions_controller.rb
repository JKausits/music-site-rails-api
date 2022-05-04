class Users::SessionsController < Devise::SessionsController
  respond_to :json
  wrap_parameters :user

  private
  def respond_with(resource, _opts = {})
    render json: { token: current_token }, status: :ok
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end