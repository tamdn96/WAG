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
  enum status_detect: [:no , :yes]

  scope :_created_at_desc, -> {order(created_at: :desc)}
  scope :has_positions_ids, -> (p_ids) {
    joins(:position).where('positions.id': p_ids )
  }
  scope :_reportable_type, -> (type) {
    where(reportable_type: type)
  }

  after_create :detect_image
  accepts_nested_attributes_for :position

  private

  def detect_image
    source_img = self.image.path
    fname = (Time.now.to_f * 1000).floor.to_s + source_img.split('/').last.to_s
    Dir.mkdir(Rails.root.join('tmp/detect_images')) unless Dir.exist?(Rails.root.join('tmp/detect_images'))
    result = "#{Rails.root}/tmp/detect_images/result.txt"
    image_detected = "#{Rails.root}/tmp/detect_images/#{fname}"
    system("cd lib/darknet && ./darknet detector test #{source_img} #{image_detected.split(".")[0..-2].join(".")} > #{result}")
    status_detected = 'no'
    unless File.empty?(result)
      rate = 0
      File.open(result).each do |line|
        rate = line.gsub("\n",'').split(' ').last.split("%")[0].to_i
      end
      status_detected = rate > 60 ? 'yes' : 'no'
    end
    self.update_attributes(image_detect: File.open(image_detected), status_detect: status_detected)
  end
end
