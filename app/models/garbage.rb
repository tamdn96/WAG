class Garbage < ApplicationRecord
  has_one :position, as: :positionable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  delegate :lat, to: :position, allow_nil: true
  delegate :long, to: :position, allow_nil: true
  delegate :address, to: :position, allow_nil: true

  enum status: [:ok, :nok]
  enum level: [:low, :mid, :high]

  scope :_qrcode, -> (qrcode) { where(qrcode: qrcode) }
end
