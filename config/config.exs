# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gym_app_backend,
  ecto_repos: [GymAppBackend.Repo]

config :gym_app_backend, GymAppBackend.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :gym_app_backend, GymAppBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9Zsb4MQ3EkrE+ZGSl0MsnHY7s7wHf3itgZtcrtXLvQhthe4DsKsHhPBuIds8dGvT",
  render_errors: [view: GymAppBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GymAppBackend.PubSub,
  live_view: [signing_salt: "wM4lmTuT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
