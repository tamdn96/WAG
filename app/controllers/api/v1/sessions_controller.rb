module Api::V1
  class SessionsController < ApiController
    skip_after_action :update_auth_header, only: :create

    def create
      user = User._email_and_provider(params[:email], params[:provider]).first
      if user.present?
        if user.update_attributes(params_update_token)
          @current_user = user
          update_auth_header
          respond_200
        else
          respond_400(user.errors)
        end
      else
        respond_404('User not found, register before login')
      end
    end

    private

    def params_update_token
      params.permit(:token)
    end
  end
end
