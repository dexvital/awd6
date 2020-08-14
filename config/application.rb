require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Awd6
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config.action_mailer.delivery_method = :smtp #:sendmail, :test
    config.autoload_paths << Rails.root.join("app/lib")
    # config.autoload_paths += %W(#{Rails.root}/lib)

    # makes sure that the JavaScript copy of our translations is in sync with those in config/locales
    config.middleware.use I18n::JS::Middleware
  end
end
