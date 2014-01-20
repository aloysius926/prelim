
source 'http://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.1'

group :development, :test do
  gem 'debugger'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'thin'
  gem 'factory_girl_rails'
  gem 'rack-mini-profiler'
  gem "rails_best_practices"
end

group :development do
  gem 'rails_layout'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'faker'
end

group :production do
  gem 'rails_serve_static_assets'
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'mail'
  gem 'pg'
end

group :assets do
  gem 'therubyracer' #, "~> 0.9.9"
  gem 'sass-rails', "~> 4.0.0"
  gem 'coffee-rails', "~> 4.0.0"
  gem 'uglifier'
  gem 'twitter-bootstrap-rails'
  gem 'less-rails'
end

gem 'aws-sdk'

gem 'ransack'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'turbolinks'
gem 'simple_form'
gem 'jquery-rails'
gem 'haml'
gem "paperclip", "~> 3.0"
gem 'bcrypt-ruby','3.1.2'



group :development, :test do
begin  
  # Loads the database adapter gem based on config/database.yml
  db_gems = { "postgresql" => ["pg"],
              "sqlite3" => ["sqlite3"]}
  adapter = if File.exists?(db_config = File.join(File.dirname(__FILE__),"config","database.yml"))
  db = YAML.load_file(db_config)
  # Fetch first configured adapter
  (db["development"] || db["test"])["adapter"]
  else
    "pg"
  end
  gem *db_gems[adapter]
  ### Taken from stack overflow 4151495 should gemfile.lock be included in gitignore
rescue 
  gem "pg"
end
end