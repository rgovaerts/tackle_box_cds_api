# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tackle_box_cds,
  ecto_repos: [TackleBoxCds.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :tackle_box_cds, TackleBoxCdsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O0/52rgNbi1M50KzVsvtQQP3M6a46BKX5Hd4ZMnJ3zSiIWoE7Gb32f2QHLIImiu8",
  render_errors: [view: TackleBoxCdsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TackleBoxCds.PubSub,
  live_view: [signing_salt: "MaA+X8em"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
