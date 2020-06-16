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
    config.secret_key_base = '44a62045cb7a9efb76c55a485bd2f46b562d275353b094ffb370abae23216d9ad01d9dd32165f1def2018ec645ccbf7bcf19c6c4f1d540825e22e6f7d86339fa'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
