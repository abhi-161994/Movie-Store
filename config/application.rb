require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovieStore
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.to_prepare do
      Devise::SessionsController.layout "login"
      # Devise::SessionsController.layout "login"
      # Devise::RegistrationsController.layout "signup"
    end

    config.active_job.queue_adapter = :sidekiq
    config.load_defaults 5.1


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

end
end
