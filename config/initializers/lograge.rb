# frozen_string_literal: true

Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_options = lambda do |event|
    {
      time: Time.now,
      host: event.payload[:host]
    }
  end
end
