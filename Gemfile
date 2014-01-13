source 'https://rubygems.org'
ruby "2.1.0"
gem 'rails', '4.0.1'

gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.1.1'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'rb-fsevent', '~> 0.9.4'

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  # Uncomment this line on OS X.
  gem 'growl'
  gem 'guard-rspec'
  gem 'rspec-rails'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Heroku integration has previously relied on using the Rails plugin system, which has been removed from Rails 4.
# To enable features such as static asset serving and logging on Heroku please add rails_12factor gem to your Gemfile.
#At the end of Gemfile add:
group :production do
  gem 'rails_12factor'
end