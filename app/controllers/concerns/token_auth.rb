module TokenAuth
  extend ActiveSupport::Concern

  included do
    after_action :update_auth_header
  end

  protected

  def set_user_by_token
    email = request.headers['email']
    provider = request.headers['provider']
    access_token = request.headers['access-token']

    @current_user = User.auth_user(email, provider, access_token)
  end

  def current_user
    @current_user
  end

  def update_auth_header
    return unless current_user
    response.set_header('email', current_user.email)
    response.set_header('provider', current_user.provider)
    response.set_header('access-token', current_user.token)
  end
end
