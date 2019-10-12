class Report < ApplicationRecord
  mount_uploader :image, ReportImageUploader
  mount_uploader :image_detect, ReportImageUploader

  belongs_to :reportable, polymorphic: true
  belongs_to :user
  has_one :position, as: :positionable, dependent: :destroy

  enum status: [:clean, :warning, :overflow]
  enum report_type: [:report, :contribute]

  accepts_nested_attributes_for :position

  after_create :detect_image

  private

  def detect_image
    source_img = self.image.path
    fname = Time.now source_img.split('/').last
    Dir.mkdir(Rails.root.join('tmp/detect_images')) unless Dir.exist?(Rails.root.join('tmp/detect_images'))
    image_detected = "#{Rails.root}/tmp/detect_images/"
    # use python detect hear
    status_detected = 'clear'
    self.update_attributes(image_detect: File.open(image_detected), status_detect: status_detected)
  end
end
