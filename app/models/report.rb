class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :user
  has_one :position
end
