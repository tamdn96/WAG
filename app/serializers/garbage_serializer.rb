class GarbageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :qrcode, :name, :area, :status, :level, :image, :created_at, :updated_at
end
