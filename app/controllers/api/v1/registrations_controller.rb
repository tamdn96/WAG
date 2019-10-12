module Api::V1
  class RegistrationsController < ApiController
    # skip_after_action :update_auth_header, only: :create

    # def create
    #   user = User.new(params_sign_up)
    #   if user.save
    #     @current_user = user
    #     update_auth_header
    #     respond_200
    #   else
    #     respond_400(user.errors)
    #   end
    # end

    # private

    # def params_sign_up
    #   params.require(:user).permit(:email, :provider, :fullname, :token)
    # end
  end
end
