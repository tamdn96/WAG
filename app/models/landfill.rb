class Landfill < ApplicationRecord
  has_many :reports, dependent: :destroy
end
