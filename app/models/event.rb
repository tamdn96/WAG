class Event < ApplicationRecord
  belongs_to :user
  has_one :position, as: :positionable, dependent: :destroy
  accepts_nested_attributes_for :position
end
