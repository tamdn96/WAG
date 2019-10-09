module Api::V1
  class SessionsController < ApiController
    before_action :set_user_by_token, only: :destroy
    skip_after_action :update_auth_header, only: [:create, :destroy]

    def create
      user = User.find_or_initialize_by(email: params[:email], provider: params[:provider])
      user.token = params[:'access-token']
      user.fullname = params[:fullname]
      if user.save
        @current_user = user
        update_auth_header
        respond_200
      else
        respond_400(user.errors)
      end
    end

    def destroy
      return respond_404 unless current_user
      if current_user.update_attributes(token: nil)
        respond_200
      else
        respond_400(current_user.errors)
      end
    end
  end
end
