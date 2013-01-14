source 'https://rubygems.org'

gem 'rails', '3.2.3'
group :production do
  gem 'pg'
end
gem 'thin'
gem 'haml-rails'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'haml-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'therubyracer'
gem 'execjs'
gem 'jquery-rails'
gem 'devise'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'spork', '1.0.0rc3'
  gem 'guard-spork'
end