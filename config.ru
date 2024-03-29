# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
require 'rack/cors'

# Allow font files to be loaded from anywhere (for loading webfonts on admin)
use Rack::Cors do
  allow do
    origins '*'
    resource '/assets/fontawesome-webfont-*', headers: :any, methods: :get
  end
end

run Rails.application
