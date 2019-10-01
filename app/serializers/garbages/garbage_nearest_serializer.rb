class Garbages::GarbageNearestSerializer < GarbageSerializer
  set_type :garbage
  attributes :lat, :long, :address
end
