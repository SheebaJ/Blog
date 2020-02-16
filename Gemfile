source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'friendly_id', '~> 5.2.4'
gem 'hirb'
gem 'jbuilder', '~> 2.5'
gem 'pry'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
 
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem 'rspec-rails', '~> 4.0.0.beta'
end


group :production do
  gem 'pg', '>= 0.18', '< 2.0'
  gem 'rails_12factor' 
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'sqlite3'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'chromedriver-helper'
  gem 'capybara', '>= 2.15'
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
