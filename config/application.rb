require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module QuakismartBootstrap
  class Application < Rails::Application 
    # For Handling MemCachier 
    config.cache_store = :dalli_store
    # Handling 404 and 500 error pages
    config.exceptions_app = self.routes
  end
end
