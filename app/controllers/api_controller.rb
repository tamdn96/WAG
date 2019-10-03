class ApiController < ActionController::API
  include TokenAuth
  include ApiResponse
  include ErrorHandling

  def authenticate_user!
    respond_401 unless current_user
  end
end
