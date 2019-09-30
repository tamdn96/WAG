module ErrorSerializer
  def self.serialize(errors, code)
    return if errors.nil?
    json = { status: code }
    new_hash = errors.to_hash(true).map do |key, value|
      value.map do |message|
        { field_name: key, full_message: message }
      end
    end.flatten
    json[:errors] = new_hash
    json
  end

  def self.to_error_json(code, detail, source=nil, title=nil)
    {
      errors: [
        {
          status: code,
          source: source,
          title: title,
          detail: detail
        }.compact
      ]
    }
  end
end
