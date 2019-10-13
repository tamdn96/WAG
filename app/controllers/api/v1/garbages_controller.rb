module Api::V1
  class GarbagesController < ApiController
    # before_action :set_user_by_token
    before_action :authenticate_user!
    before_action :get_garbage_by_qrcode, only: :show

    def test
      respond_200
    end

    def nearest
      # TODO: use lat long to calc garbages near
      nearest_positions_ids = Position.nearest([params[:latitude], params[:longitude]]).map(&:id)
      garbages = Garbage.has_positions_ids(nearest_positions_ids)
      landfills = Landfill.nearest_position(nearest_positions_ids)
      respond_200(::Garbages::GarbageNearestSerializer.new(garbages + landfills).serializable_hash)
    end

    def show
      respond_200(::Garbages::GarbageShowSerializer.new(@garbage).serializable_hash)
    end

    private

    def position_params
      params.permit(:latitude, :longitude)
    end

    def get_garbage_by_qrcode
      @garbage = Garbage._qrcode(params[:qrcode]).first
      return if @garbage
      respond_404
    end
  end
end
