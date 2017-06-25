Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false

  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true

  # NOTE: not working controller update
  # ref. https://www.tcmobile.jp/dev_blog/programming/rails5-on-vagrant-%E3%81%AEdevelopment%E3%81%A7%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AE%E5%A4%89%E6%9B%B4%E3%81%8C%E5%8F%8D%E6%98%A0%E3%81%95%E3%82%8C%E3%81%AA%E3%81%84/
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.file_watcher = ActiveSupport::FileUpdateChecker

  # NOTE: remote setting
  # BetterErrors::Middleware.allow_ip! '192.168.254.12'

end
