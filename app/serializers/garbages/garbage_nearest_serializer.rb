class Garbages::GarbageNearestSerializer < GarbageSerializer
  set_type :garbage
  attributes :latitude, :longitude, :address
end
