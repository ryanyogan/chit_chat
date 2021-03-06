# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chit_chat,
  ecto_repos: [ChitChat.Repo]

# Configures the endpoint
config :chit_chat, ChitChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZCoOtdDzVmTV/ngq3JEN2/8oxA6Qe5AuPoK5/FVYtq/vuMjmj3sd7vshgyNvQN9M",
  render_errors: [view: ChitChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ChitChat.PubSub,
  live_view: [signing_salt: "oAV7D09+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
