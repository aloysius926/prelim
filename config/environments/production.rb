Prelims::Application.configure do
  # This file takes precedence over config/application.rb
  config.action_mailer.default_url_options = {
         host: 'fathomless-crag-2414.herokuapp.com' }
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
  address:              'smtp.sendgrid.net',
  port:                 '587',
  authentication:       :plain,
  user_name:            ENV['SENDGRID_USERNAME'],
  password:             ENV['SENDGRID_PASSWORD'],
  domain:               'heroku.com',
  enable_starttls_auto: true
    }
  # Code is not reloaded between requests
  config.cache_classes = true
  config.eager_load = true
  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Force all access to the app over SSL and use secure cookies.
  config.force_ssl = true

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  config.paperclip_defaults = {
  storage: :s3,
  s3_credentials: {
    bucket:             ENV['S3_BUCKET_NAME'],
    access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY']
  }
}
end
