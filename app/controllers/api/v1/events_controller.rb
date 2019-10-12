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

    def index_current_week
      hot_events = Event._start_in_this_week
      nearest_positions_ids = Position._positionable_type('Event').nearest([params[:latitude], params[:longitude]]).map(&:id)
      nearest_events = Event.has_positions_ids(nearest_positions_ids)._nearest_in_this_week
      suggest_events = Event._suggest_in_this_week
      respond_200(::EventSerializer.new(hot_events + nearest_events + suggest_events).serializable_hash)
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
