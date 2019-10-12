class Reports::IndexSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :report_type
  attribute :group_date do |obj|
    obj.created_at.to_date == Date.today ? 'today' : 'oldday'
  end
end
