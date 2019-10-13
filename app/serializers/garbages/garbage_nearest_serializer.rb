class Garbages::GarbageNearestSerializer
  include FastJsonapi::ObjectSerializer
  attributes :latitude, :longitude, :address, :status
  attribute :type do |obj|
    obj.class.to_s
  end
end
