class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader
  belongs_to :user
  has_one :position, as: :positionable, dependent: :destroy
  has_many :event_joiners, dependent: :destroy

  delegate :latitude, to: :position, allow_nil: true
  delegate :longitude, to: :position, allow_nil: true
  delegate :address, to: :position, allow_nil: true

  accepts_nested_attributes_for :position

  scope :_time_start_asc, -> {order(time_start: :asc)}
  scope :_in_this_week, -> {
    where("YEARWEEK(events.time_start, 1) = YEARWEEK(CURDATE(), 1) and events.time_start > CURRENT_TIMESTAMP()")
  }
  scope :_incomming, -> {
    where('events.time_start > CURRENT_TIMESTAMP()')._time_start_asc
  }
  scope :_start_in_this_week, -> {
    select("events.*, 'hot_week' as group_event")._in_this_week._time_start_asc
  }
  scope :_nearest_in_this_week, -> {
    select("events.*, 'nearest_week' as group_event")._in_this_week._time_start_asc
  }
  scope :_suggest_in_this_week, -> {
    select("events.*, 'suggest_week' as group_event")._in_this_week._time_start_asc.sample(3)
  }

  scope :has_positions_ids, -> (p_ids) {
    joins(:position).where('positions.id': p_ids )
  }
end
