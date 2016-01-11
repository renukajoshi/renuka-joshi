require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de


<<<<<<< HEAD
   ActionMailer::Base.smtp_settings = {
       :address => 'smtp.gmail.com',
       :domain => 'mail.google.com',
       :port => 587,
       :user_name => "renuka.joshi92@gmail.com",
       :password => "raj@oct92",
       :authentication => 'login',
       :enable_starttls_auto => true }
=======
   # ActionMailer::Base.smtp_settings = {
   #    :address => 'smtp.gmail.com',
    #   :domain => 'mail.google.com',
     #  :port => 587,
      # :user_name => "renuka.joshi92@gmail.com",
       #:password => "raj@oct92",
       #:authentication => 'login',
       #:enable_starttls_auto => true }
>>>>>>> 6710ac8f009fce6b606133c48f6f9ac60db433f5


       #ActionMailer::Base.delivery_method = :smtp
      #ActionMailer::Base.smtp_settings = {
      #:tls => true,
      #:address => "smtp.gmail.com",
      #:port => 587,
      #:domain => "gmail.com",
      #:authentication => :login,
      #:user_name => "renuka.joshi92@gmail.com",
      #:password => "raj@oct92"
      #  }

  end
end
