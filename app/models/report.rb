class Report < ApplicationRecord
  mount_uploader :image, ReportImageUploader
  mount_uploader :image_detect, ReportImageUploader

  belongs_to :reportable, polymorphic: true
  belongs_to :user
  has_one :position, as: :positionable, dependent: :destroy

  delegate :latitude, to: :position, allow_nil: true
  delegate :longitude, to: :position, allow_nil: true
  delegate :address, to: :position, allow_nil: true

  enum status: [:clean, :warning, :overflow]
  enum report_type: [:report, :contribute]

  scope :_created_at_desc, -> {order(created_at: :desc)}
  scope :today, -> {
    where('DATE(created_at) = ?', Date.today)
  }
  scope :olddays, -> {
    where('DATE(created_at) < ?', Date.today)
  }

  after_create :detect_image
  accepts_nested_attributes_for :position

  private

  def detect_image
    source_img = self.image.path
    fname = (Time.now.to_f * 1000).floor.to_s + source_img.split('/').last.to_s
    Dir.mkdir(Rails.root.join('tmp/detect_images')) unless Dir.exist?(Rails.root.join('tmp/detect_images'))
    image_detected = "#{Rails.root}/tmp/detect_images/#{fname}"
    # system(`cd lib/darknet && ./darknet detector test data/garbage-1.jpg 123 > result.txt`)
    # # use python detect hear
    status_detected = 'clear'
    self.update_attributes(image_detect: File.open(source_img), status_detect: status_detected)
  end
end
