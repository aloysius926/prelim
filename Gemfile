
source 'http://rubygems.org'

gem 'rails', '4.0.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
end

group :test do
  gem 'cucumber-rails'
  
end

group :production do
  gem 'pg'
  gem 'aws-sdk'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer' #, "~> 0.9.9"
  gem 'sass-rails', "~> 4.0.0"
  gem 'coffee-rails', "~> 4.0.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml'
gem "paperclip", "~> 3.0"