class Landfill < ApplicationRecord
  has_many :reports, dependent: :destroy
  enum status: [:clean, :warning, :overflow]
end
