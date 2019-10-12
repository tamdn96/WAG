class ReportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :level, :note, :image, :image_detect, :report_type, :status_detect
end
