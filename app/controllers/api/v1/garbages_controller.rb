module Api::V1
  class GarbagesController < ApiController
    # before_action :authenticate_user!

    def nearest
      # TODO: use lat long to calc garbages near
      garbages = Garbage.all.includes(:position)
      respond_200(::Garbages::GarbageNearestSerializer.new(garbages).serializable_hash)
    end

    private

    def position_params
      params.permit(:lat, :long)
    end
  end
end
