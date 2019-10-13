class Landfill < ApplicationRecord
  has_one :report,  as: :reportable, dependent: :destroy
  enum status: [:clean, :warning, :overflow]

  delegate :latitude, to: :report, allow_nil: true
  delegate :longitude, to: :report, allow_nil: true
  delegate :address, to: :report, allow_nil: true

  scope :has_report_ids, -> (r_ids) {
    joins(:report).where('reports.id': r_ids)
  }

  class << self
    def nearest_position(p_ids)
      rp_ids = Report._reportable_type('Landfill').has_positions_ids(p_ids).map(&:id)
      has_report_ids(rp_ids)
    end
  end
end
