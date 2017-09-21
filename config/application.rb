require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Parts
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    #config.paperclip_defaults = { storage: :fog, fog_credentials: { provider: "Local", local_root: "#{Rails.root}/public"}, fog_directory: "", fog_host: "localhost"}
    config.i18n.default_locale = :"pt-BR"
  end
end
