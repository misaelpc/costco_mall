# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :costco_mall,
  ecto_repos: [CostcoMall.Repo]

# Configures the endpoint
config :costco_mall, CostcoMallWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iHt03z+9qJEpV87wNJRQOwDnuEzrz8B9LjKMdhr5LinC7wfXLx2ZGQGgNY7ibouE",
  render_errors: [view: CostcoMallWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CostcoMall.PubSub,
  live_view: [signing_salt: "htUErVGw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :fcmex,
  server_key: "AAAAcFP3GWE:APA91bEmZu4zem2_sNog0RCy3joapdYELOm0YWp91dbe0sEifIyPq-cOIRiROu5Ui2g9-mEEKnOLZjXGEt5jtd_a4E1N_TBEYuhw3C7aY4lXMespnyUTB7gaThBkDROVbhWuCoz1Vn1d"

config :costco_mall, CostcoMall.PromEx,
  disabled: false,
  manual_metrics_start_delay: :no_delay,
  drop_metrics_groups: [],
  grafana: [
    host: "http://localhost:3000",
    username: "admin",  # Or authenticate via Basic Auth
    password: "YwfRvyxV6DkmfjZ6",
    upload_dashboards_on_start: true # This is an optional setting and will default to `true`
  ],
  metrics_server: :disabled
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
