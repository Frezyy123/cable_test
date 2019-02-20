# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.
config :cables,
  profiles: [
    default: [
      max_streams: 100,
      max_requests: 100,
      min_connections: 200,
      max_connections: 10000,
      threshold: 500,
      connection_opts: %{
        retry: 0,
        http_opts: %{keepalive: :infinity}
      }
    ],
    http: [
      max_requests: :infinity,
      max_connections: 2048,
      max_streams: 1
    ]
  ]

config :logger,
  level_info: :error,
  discard_threshold: 100_000

config :logger,
  backends: [
    {LoggerFileBackend, :error_log},
    {LoggerFileBackend, :info_log}
  ]

config :logger, :error_log,
  path: "./logs/error.log",
  level: :error,
  format: "$date $time $metadata[$level] $message\n",
  metadata: [:user_id]

config :logger, :info_log,
  path: "./logs/info.log",
  level: :info,
  format: "$date $time $metadata[$level] $message\n",
  metadata: [:user_id]

# You can configure your application as:
#
#     config :cable_test, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:cable_test, :key)
#
# You can also configure a 3rd-party app:

config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
