module ErrorHandling
  extend ActiveSupport::Concern
  included do
    rescue_from ::Net::ReadTimeout, with: :net_timeout
  end

  private

  def net_timeout
    render json: ErrorSerializer.to_error_json(Settings.error_code.system, I18n.t('error_message.respond_500.net_timeout'))
  end
end
