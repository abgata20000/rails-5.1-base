require_relative 'boot'

# Racksack using simple_form
require File.expand_path('../boot', __FILE__)
ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.active_record.default_timezone = :local
    config.time_zone = "Tokyo"
    I18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.beginning_of_week = :sunday

    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.orm :active_record
      g.template_engine :slim
      g.test_framework :rspec, fixture: true, fixture_replacement: :factory_girl
      g.view_specs false
      g.controller_specs false
      g.routing_specs false
      g.helper_specs false
      g.request_specs false
      g.assets false
      g.helper false
    end

    config.assets.precompile += %w(vendor/assets/images/*)

    config.enable_dependency_loading = true # rails5のおまじない
    config.autoload_paths += %W(#{config.root}/lib)
    # config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.eager_load_paths += Dir[Rails.root.join('app', 'decorators', 'concerns')]
    config.eager_load_paths += Dir[Rails.root.join('app', 'uploaders', 'concerns')]
    # config.eager_load_paths << Rails.root.join("lib")

    # NOTE: Responsed to too late better_errors
    #   ref. http://y-yagi.tumblr.com/post/144335019925/rails-50-puma-3%E7%B3%BB%E3%81%AE%E7%92%B0%E5%A2%83%E3%81%A7better-errors
    if ENV['FAST_BETTER_ERRORS'] == "1"
      def inspect
        "#<#{self.class}>"
      end
    end
  end
end
