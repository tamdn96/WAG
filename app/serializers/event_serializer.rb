class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :time_start, :latitude, :longitude, :address
  attribute :image do |obj|
    Settings.host_url + obj.image.url
  end
end
