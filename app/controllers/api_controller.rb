class ApiController < ActionController::API
  # include DeviseTokenAuth::Concerns::SetUserByToken
  include ApiResponse
  include ErrorHandling

  def authenticate_user!
    respond_401 unless current_user
  end
end
