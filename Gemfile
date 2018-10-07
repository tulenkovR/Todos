# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'active_model_serializers', '~> 0.10.0'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 5.2.1'
gem 'will_paginate', '~> 3.1.0'
gem 'pundit'
gem 'rack-attack'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
