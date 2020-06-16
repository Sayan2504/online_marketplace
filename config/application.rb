require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OnlineMarketplace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Kolkata'    
    config.assets.initialize_on_precompile = false
    config.secret_key_base = '6ecdfe98befc5bcd6d36874f588422a4c712e185cb39c6e3283cb84373bff81fdc3bdf7e5bfa73d3b62e5bce18d517e5631a0e417c85638ea6142d124743a29b'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
