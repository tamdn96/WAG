class Reports::ShowSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :status, :status_detect, :image_detect, :note
end
