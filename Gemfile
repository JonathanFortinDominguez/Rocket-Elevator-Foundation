source 'http://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'bootstrap-social-rails'
gem "font-awesome-rails", github: "bokmann/font-awesome-rails", branch: "master"
gem 'font-awesome-sass'
gem 'mixitup-rails', '~> 3.3', '>= 3.3.1'
gem 'owlcarousel-rails'
gem 'magnific-popup-rails'
gem 'popper_js' 
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem 'bcrypt'
gem 'rails_admin_rollincode', '~> 1.0'
gem 'rails_admin'
gem "cancan"

gem 'rspotify'

gem 'sendgrid-ruby'

gem 'twilio-ruby', '~> 5.28.0'

gem 'rake'

gem 'slack-notifier'

gem 'zendesk_api', '~> 1.20'

gem 'ibm_watson'

gem 'swapi'

gem 'newrelic_rpm'

gem "figaro"

gem 'rest-client'

gem 'dropbox_api'

gem 'open-weather'

gem 'faraday'

gem 'geocoder'

gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'activerecord', '~> 5.0', '>= 5.0.0.1'
gem 'whenever', require: false
gem 'activestorage-database-service', github: 'TitovDigital/activestorage-database-service'
gem 'rails_admin_charts'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'devise', '~> 4.7', '>= 4.7.1'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'capistrano-rails', '~> 1.4', require: false
gem 'capistrano-bundler', '>= 1.1.0'
gem 'rvm1-capistrano3', require: false
gem 'capistrano3-puma'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano',      require: false
  gem 'capistrano-rake', require: false
  gem 'capistrano-figaro-yml', '~> 1.0.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'simplecov', require: false
  gem 'html_validation'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
