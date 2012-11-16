source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
group :development do
  gem "mysql2", "~> 0.3.11"
end

group :test do
  gem "mysql2", "~> 0.3.11"
end

group :production do
  gem "pg"
  gem "thin"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
end

# stuff to support Heroku deployment/performance
gem 'dalli'  # for memcached
gem 'newrelic_rpm'

gem 'jquery-rails'
gem 'jquerytools-rails', git: 'git://github.com/wafcio/jquerytools-rails.git'
gem 'execjs'
gem 'will_paginate', '~> 3.0.0'
gem 'haml', '~> 3.1.7'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
