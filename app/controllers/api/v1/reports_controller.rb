module Api::V1
  class ReportsController < ApiController
    before_action :authenticate_user!

    def create
      report = Report.new(report_params.merge(user: current_user))
      get_reportable(report)
      if report.save
        respond_200
      else
        respond_404
      end
    end

    private

    def report_params
      params.require(:report).permit(
        :image,
        :status,
        :note,
        :report_type
      ).merge(position_nested_params)
    end

    def position_nested_params
      {
        position_attributes: params.require(:report).permit(
          :latitude,
          :longitude,
          :address
        )
      }
    end

    def get_reportable(report)
      if report.report?
        reportable = params[:report][:garbage_id].present? ? Garbage.find_by(id: params[:report][:garbage_id]) : Landfill.create(landfill_params)
      else
        reportable = Landfill.find_by(id: report.landfill_id)
      end
      report.assign_attributes(reportable: reportable)
    end

    def landfill_params
      params.require(:report).permit(:status)
    end
  end
end
