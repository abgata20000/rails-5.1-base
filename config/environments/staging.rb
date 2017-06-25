BetterErrors::Middleware.allow_ip! "0.0.0.0/0"

Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.assets.version = '1.0'

  config.log_level = :info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # ETC
  if ENV['ASSET_HOST'].present?
    config.action_controller.asset_host = ENV['ASSET_HOST']
    config.action_mailer.asset_host = ENV['ASSET_HOST']
  end
  if ENV['DEFAULT_URL_OPTIONS'].present?
    config.action_mailer.default_url_options= { host: ENV['DEFAULT_URL_OPTIONS'] }
  end

  config.active_record.dump_schema_after_migration = false
  config.action_mailer.delivery_method = :letter_opener_web
  config.action_mailer.default_url_options = {
    host: "#{ENV['HEROKU_APP_NAME']}.herokuapp.com",
    protocol: "https"
  }
  Rails.application.routes.default_url_options = {
    host: "#{ENV['HEROKU_APP_NAME']}.herokuapp.com",
    protocol: "https"
  }

  # heroku 対応
  if File.exist?(Rails.root + "config/database.heroku.yml")
    config.paths.add "config/database", with: "config/database.heroku.yml"
  end
end
