class Garbages::GarbageShowSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :latitude, :longitude
end
