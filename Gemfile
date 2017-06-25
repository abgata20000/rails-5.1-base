source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'modernizr-rails'
gem 'dotenv-rails'
gem 'slim-rails'
gem 'html2slim'
gem 'simple_form'
gem 'active_hash'
gem 'active_type'

gem 'default_value_for'
gem 'enumerize', github: 'brainspec/enumerize'
gem 'active_decorator'
gem 'active_decorator_with_decorate_associations'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'httpclient'
gem 'baby_squeel'
gem 'gon'
gem 'kaminari'
gem 'kaminari-bootstrap', '~> 3.0.1'
gem 'ransack'
gem 'activerecord-import'
gem 'paranoia', '~> 2.2'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-history'
gem 'sidekiq-statistic'
gem 'redis-namespace'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :development, :test do
  gem 'byebug'
  gem 'capistrano-rails'
  gem 'selenium-webdriver'
  #
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'fakeweb'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'database_rewinder'
  gem 'delorean'
  gem 'rubocop', require: false
  gem 'brakeman'
  gem 'faker'
  gem 'database_cleaner'
  gem 'launchy', '~> 2.4.2'
  gem 'rspec_junit_formatter' #for circleci
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
  gem 'bullet'
  gem 'rspec-json_matcher'
  gem 'capybara'
  gem 'simplecov'
end

group :development, :staging do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-footnotes'
end

group :production do
  # Heroku setting
  gem 'rails_12factor'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_best_practices', require: false
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'view_source_map'
  gem 'awesome_print'
  gem 'rails-erd'
  gem 'brakeman', :require => false
end