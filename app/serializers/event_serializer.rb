class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :time_start, :latitude, :longitude, :address, :image
  attribute :group_event
end
