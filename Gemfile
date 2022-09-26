# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # rspec-rails is a testing framework for Rails 5+.
  gem "rspec-rails", "~> 5.1", ">= 5.1.2"

  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem "factory_bot_rails", "~> 6.2"

  # Ffaker generates dummy data.
  gem "ffaker", "~> 2.21"

  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem "faker", "~> 2.23"

  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that,
  # if written by hand, would be much longer, more complex, and error-prone.
  gem "shoulda-matchers", "~> 5.2"

  # RuboCop is a Ruby code style checking and code formatting tool.
  # It aims to enforce the community-driven Ruby Style Guide.
  gem "rubocop", "~> 1.36"

  # Code style checking for RSpec files. A plugin for the RuboCop code style enforcing & linting tool.
  gem "rubocop-rspec", "~> 2.13", ">= 2.13.2"

  # Automatic Rails code style checking tool.
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem "rubocop-rails", "~> 2.16", ">= 2.16.1"

  # A collection of RuboCop cops to check for performance optimizations in Ruby code.
  gem "rubocop-performance", "~> 1.15"

  # A collection of RuboCop cops to check for downstream compatability issues in the Ruby code.
  gem "rubocop-packaging", "~> 0.5.2"

  # Automatic Minitest code style checking tool.
  # A RuboCop extension focused on enforcing Minitest best practices and coding conventions.
  gem "rubocop-minitest", "~> 0.22.1"

  # An interface which glues ruby-debug to IDEs like Eclipse (RDT), NetBeans and RubyMine.
  gem "ruby-debug-ide", "~> 0.7.3"

  # debase is a fast implementation of the standard Ruby debugger debug.rb for Ruby 2.0+.
  # It is implemented by utilizing a new Ruby TracePoint class.
  # The core component provides support that front-ends can build on.
  # It provides breakpoint handling, bindings for stack frames among other things.
  gem "debase", "~> 0.2.5.beta2"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring", "~> 4.0"

  # The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!
  gem "listen", "~> 3.7"

  # A thin and fast web server
  gem "thin", "~> 1.8", ">= 1.8.1"
end

# Autoload dotenv in Rails.
gem "dotenv-rails", "~> 2.8", ">= 2.8.1"

# Use Pry as your rails console
gem "pry-rails", "~> 0.3.9"

# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem "active_model_serializers", "~> 0.10.13"

# Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 4+
gem "kaminari", "~> 1.2", ">= 1.2.2"

# ActiveInteraction manages application-specific business logic. It is an implementation of the command pattern in Ruby.
gem "active_interaction", "~> 5.1", ">= 5.1.1"

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem "jwt", "~> 2.5"

# Extraction of the key_transform abilities of ActiveModelSerializers
gem "case_transform", "~> 0.2"

# A set of common locale data and translations to internationalize and/or localize your Rails applications.
gem "rails-i18n", "~> 7.0", ">= 7.0.5"

# Object oriented authorization for Rails applications
gem "pundit", "~> 2.2"

# ActiveModel Serializers addon for eliminating N+1 queries problem from the serializers.
gem "ams_lazy_relationships", "~> 0.3.2"
