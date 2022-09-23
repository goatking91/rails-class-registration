# frozen_string_literal: true

require_relative "boot"

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
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsClassRegistration
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.autoload_paths += [Rails.root.join("app/services/concern"), Rails.root.join("app/errors")]
    config.time_zone = "Asia/Seoul"
    config.active_record.default_timezone = :local

    config.hosts.clear

    if ENV["RAILS_LOG_TO_STDOUT"].present?
      logger           = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger    = ActiveSupport::TaggedLogging.new(logger)
    end

    # TODO: 추후 시간 수정 필요
    config.x.auth.access_token_ttl_in_seconds = 7.day.to_i
    config.x.auth.refresh_token_ttl_in_seconds = 1.days.to_i

    config.x.auth.secret_key = ENV.fetch("AUTH_SECRET_KEY", "")
    config.x.auth.signing_algorithm = ENV.fetch("AUTH_SIGNING_ALGORITHM", "")

    config.active_record.encryption.primary_key = ENV.fetch("PRIMARY_KEY", "")
    config.active_record.encryption.deterministic_key = ENV.fetch("DETERMINISTIC_KEY", "")
    config.active_record.encryption.key_derivation_salt = ENV.fetch("KEY_DERIVATION_SALT", "")

    config.action_dispatch.show_exceptions = true
    config.exceptions_app = self.routes

    config.generators do |g|
      g.test_framework :rspec,
                       request_specs: false,
                       view_specs: false,
                       routing_specs: false,
                       helper_specs: false,
                       generator_specs: false,
                       controller_specs: true
    end

    require Rails.root.join("lib/middlewares/handle_bad_request")
    config.middleware.insert_after ActionDispatch::DebugExceptions, Middleware::HandleBadRequest

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.i18n.available_locales = [:ko]
    config.i18n.default_locale = :ko
  end
end
