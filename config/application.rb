require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApi
  class Application < Rails::Application
     # Initialize configuration defaults for originally generated Rails version.

     # config.load_defaults 7.1
     config.session_store :cookie_store, key: "_interslice_session"
     config.middleware.use ActionDispatch::Cookies
     config.middleware.use config.session_store, config.session_options

     config.autoload_paths += %W[
      #{config.root}/app/repositories/consortium
      #{config.root}/app/domain/usecase/consortium_usecase
      #{config.root}/app/domain/usecase/entity_usecase
      #{config.root}/app/repositories/entity
      #{config.root}/app/domain/entity


     ]


     # {config.root}/app/controllers/users/registrations_controller







     # Please, add to the `ignore` list any other `lib` subdirectories that do
     # not contain `.rb` files, or that should not be reloaded or eager loaded.
     # Common ones are `templates`, `generators`, or `middleware`, for example.
     # config.autoload_paths += %W[#{config.root}/app/use_case]







     # Configuration for the application, engines, and railties goes here.
     #
     # These settings can be overridden in specific environments using the files
     # in config/environments, which are processed later.
     #
     # config.time_zone = "Central Time (US & Canada)"
     # config.eager_load_paths << Rails.root.join("extras")

     # Only loads a smaller set of middleware suitable for API only apps.
     # Middleware like session, flash, cookies can be added back manually.
     # Skip views, helpers and assets when generating a new resource.
     config.api_only = true
  end
end
