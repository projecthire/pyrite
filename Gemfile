source "https://rubygems.org"

ruby "2.2.3"

gem "airbrake"
gem "autoprefixer-rails"
gem "coffee-rails", "~> 4.1.0"
gem 'contentful_model'
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "rack-canonical-host"
gem "puma"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "refills"
gem "sass-rails", "~> 5.0"
gem 'bootstrap-sass', '~> 3.3.5'
gem 'font-awesome-sass', '~> 4.4.0'
gem "simple_form"
gem "title"
gem "uglifier", "~>2.7.2"
gem "sprockets-es6"
gem 'faker'
gem 'devise'
gem 'rails_admin'
gem 'rack-cors', require: 'rack/cors'
gem 'slim-rails'
gem 'wicked'
gem 'enum_help'
gem 'omniauth'
gem 'omniauth-linkedin'
gem 'linkedin'

# see https://rails-assets.org/
source 'https://rails-assets.org' do
  gem 'rails-assets-backbone.marionette'
  gem 'rails-assets-bootstrap-validator'
  gem 'rails-assets-alertify-bootstrap-3'
  gem 'rails-assets-bootstrap-select'
  gem 'rails-assets-momentjs'
end

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem 'guard-foreman'
  # waiting on https://github.com/guard/guard-livereload/issues/142
  # gem 'guard-livereload', require: false
  gem "web-console"
  gem 'letter_opener'
  gem 'html2slim'
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.3.0"
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "codeclimate-test-reporter", require: nil
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
