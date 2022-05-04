class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  wrap_parameters :user
  private
  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed(resource)
  end
  def register_success
    render json: { message: 'Signed up.' }
  end
  def register_failed(resource)
    render json: { messages: resource.errors.full_messages}, status: :unprocessable_entity
  end
end