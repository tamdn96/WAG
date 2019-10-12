class Reports::ShowSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :status, :status_detect, :note
  attribute :image_detect do |obj|
    Settings.host_url + obj.image_detect.url
  end

end
