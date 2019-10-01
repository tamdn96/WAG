class Garbage < ApplicationRecord
  has_one :position, dependent: :destroy
  has_many :reports, dependent: :destroy
end
