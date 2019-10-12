class Event < ApplicationRecord
  belongs_to :user
  has_one :position, as: :positionable, dependent: :destroy
  has_many :event_joiners, dependent: :destroy
  accepts_nested_attributes_for :position
end
