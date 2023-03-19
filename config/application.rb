require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oyasumi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_only = true
    config.debug_exception_response_format = :api
    config.action_controller.default_protect_from_forgery false
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    # Note: Add additional layers of security
    #     https://guides.rubyonrails.org/v4.1.4/security.html
    # config.force_ssl = true
  end
end
