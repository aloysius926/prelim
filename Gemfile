
source 'http://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.1'

group :development, :test do
  gem 'thin'
  ### The following gems are used only for testing and finding code smells. They could be removed and the app would still function
  gem 'rubocop'
  gem 'debugger'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'factory_girl_rails'
  gem 'rack-mini-profiler'
  gem "rails_best_practices"
end

group :development do
  gem 'rails_layout'
  gem 'quiet_assets'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'faker'
end

group :production do
  ### These are requested by heroku in order they make my css work (first 2), give me the correct webserver, let me send emails, use pg as heroku wants
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
  ## These give me the css to make the site look decent
  gem 'twitter-bootstrap-rails'
  gem 'less-rails'
end

### Lets me attach files to models
gem 'aws-sdk'
gem "paperclip", "~> 3.0"

### Provides searching and sorting
gem 'ransack'

### Lets me access admin tools at /admin in a browser
gem 'activeadmin', github: 'gregbell/active_admin'

### I guess this gives me faster links I needed to install it with bootstrap
gem 'turbolinks'
### Suposedly makes forms easier to create, but gives you less control so I'm trying to take it out
gem 'simple_form'
gem 'jquery-rails'
## Let's me switch and use .haml instead of .erb which is sometimes more readable
gem 'haml'

## Hashes passwords in a secure way
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
    "sqlite3"
  end
  gem *db_gems[adapter]
  ### Taken from stack overflow 4151495 should gemfile.lock be included in gitignore
rescue 
  gem "sqlite3"
end
end
