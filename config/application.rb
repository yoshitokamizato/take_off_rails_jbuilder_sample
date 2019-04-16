require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TakeOffRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    # generator の設定
    config.generators do |g|
      g.template_engine false
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework :rspec,
                       fixtures: true,
                       fixture_replacement: :factory_bot,
                       view_specs: false,
                       routing_specs: false,
                       helper_specs: false,
                       controller_specs: false,
                       request_specs: true
    end
    config.api_only = true
    config.middleware.use ActionDispatch::Flash
  end
end
