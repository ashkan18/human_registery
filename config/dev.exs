use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :human_registry, HumanRegistry.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  secret_key_base: "/KD7B02QFcQj3g5kgDMTKCMwP8zeMQrXjapZSy0MPpgyIdWa0DB49xBUVt40asbY",
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :human_registry, HumanRegistry.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :human_registry, HumanRegistry.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "human_registry_dev",
  hostname: "localhost",
  pool_size: 10
