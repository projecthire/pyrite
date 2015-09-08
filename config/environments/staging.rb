require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"))
)

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: ENV.fetch("HOST") }

  # segment.io config
  config.segment_io_key = ENV.fetch('SEGMENT_IO_KEY', '')
end
