class ApplicationController < ActionController::API
  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
  end
end
