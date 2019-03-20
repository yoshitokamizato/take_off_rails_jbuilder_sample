require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TakeOffRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    # generator の設定
    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework false
    end

  end
end
