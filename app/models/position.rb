class Position < ApplicationRecord
  belongs_to :positionable, polymorphic: true
  reverse_geocoded_by :latitude, :longitude

  scope :_positionable_type, ->(type) {where(positionable_type: type)}

  class << self
    def nearest(location)
      Position.near(location, 2, units: :km)
    end
  end
end
