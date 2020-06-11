require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = 'Brasilia'
    config.encoding = "utf-8"
    config.api_only = true

    # allow svg to be served as Content-Disposition: inline 
    # <https://github.com/rails/rails/issues/34665>
    config.active_storage.content_types_allowed_inline << "image/svg+xml"
    config.active_storage.content_types_to_serve_as_binary -= ["image/svg+xml"] 

    host = ENV['SYSTEM_DOMAIN'] || "localhost:3000"
    protocol = Rails.application.config.force_ssl ? 'https' : 'http'

    Rails.application.routes.default_url_options.merge!(
      host: host,
      protocol: protocol,
    )
  end
end
