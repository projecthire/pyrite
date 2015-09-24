require_relative "production"

# perhaps we'll want this one day?
# Mail.register_interceptor(
#   RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"))
# )

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: ENV.fetch("HOST") }
end
