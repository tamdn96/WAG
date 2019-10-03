module ApiResponse
  extend ActiveSupport::Concern

  private

  def respond_400(error = nil, format_error = true, title = nil, source = nil)
    head :bad_request and return unless  error.present?
    if format_error
      render json: ErrorSerializer.serialize(error, Settings.error_code.bad_request)
    else
      render json: ErrorSerializer.to_error_json(Settings.error_code.bad_request, error, source, title)
    end
  end

  def respond_401
    render json: ErrorSerializer.to_error_json(Settings.error_code.unauthorized, I18n.t('error_message.respond_401.authenticate_failed'))
  end

  def respond_404(error = nil, title = nil, source = nil)
    render json: ErrorSerializer.to_error_json(Settings.error_code.not_found, error)
  end

  def respond_409(error = nil, title = nil, source = nil)
    render json: ErrorSerializer.to_error_json(Settings.error_code.conflict, error)
  end

  def respond_200(response = {})
    render json: { status: Settings.success_code }.merge(response)
  end
end
