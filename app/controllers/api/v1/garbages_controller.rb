module Api::V1
  class GarbagesController < ApiController
    before_action :set_user_by_token
    before_action :authenticate_user!
    before_action :get_garbage_by_qrcode, only: :show

    def nearest
      # TODO: use lat long to calc garbages near
      garbages = Garbage.all.includes(:position)
      respond_200(::Garbages::GarbageNearestSerializer.new(garbages).serializable_hash)
    end

    def show
      respond_200(::Garbages::GarbageShowSerializer.new(@garbage).serializable_hash)
    end

    private

    def position_params
      params.permit(:lat, :long)
    end

    def get_garbage_by_qrcode
      @garbage = Garbage._qrcode(params[:qrcode]).first
      return if @garbage
      respond_404
    end
  end
end
