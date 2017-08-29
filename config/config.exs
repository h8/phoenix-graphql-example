# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cserv,
  namespace: CServ,
  ecto_repos: [CServ.Repo]

# Configures the endpoint
config :cserv, CServWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mjtO5+RYGz6dlOoh4J/PhRYq6H16vZ2TPgh5dgkqMTwSosnzJnWN20AXaxy8LD4R",
  render_errors: [view: CServWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CServ.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
