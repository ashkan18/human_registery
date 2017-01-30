# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :human_registry,
  ecto_repos: [HumanRegistry.Repo]

# Configures the endpoint
config :human_registry, HumanRegistry.Endpoint,
  url: [scheme: "https", host: System.get_env("HOST"), port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: HumanRegistry.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HumanRegistry.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :cipher, keyphrase: System.get_env("KEYPHRASE"),
                ivphrase: System.get_env("IVPHRASE"),
                magic_token: System.get_env("MAGIC_TOKEN")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
