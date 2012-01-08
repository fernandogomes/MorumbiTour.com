source 'https://rubygems.org'

gem 'rails', '3.2.0.rc1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'thin'
gem 'devise'
gem 'twitter-bootstrap-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.0'
  gem 'coffee-rails', '~> 3.2.0'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem "rails-erd"
end

gem "rspec-rails", :group => [:test, :development]
group :test do
  # Pretty printed test output 
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem "shoulda-matchers"       
  gem "ZenTest"
  gem "autotest-rails"  
  gem "autotest-growl"
  gem "autotest-fsevent"
  # gem "redgreen"
end