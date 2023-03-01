import Config

config :logger, level: :debug

config :mnesia, :dir, to_charlist(System.fetch_env!("VOL_DIR"))
