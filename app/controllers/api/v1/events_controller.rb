module Api::V1
  class EventsController < ApiController
    before_action :authenticate_user!

    def create
      event = Event.new(event_params.merge(user: current_user))
      if event.save
        respond_200
      else
        respond_404
      end
    end

    private

    def event_params
      params.require(:event).permit(
        :title,
        :time_start,
        :description,
        :image,
      ).merge(position_nested_params)
    end

    def position_nested_params
      {
        position_attributes: params.require(:event).permit(
          :latitude,
          :longitude,
          :address
        )
      }
    end
  end
end
