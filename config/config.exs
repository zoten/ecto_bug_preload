import Config

config :ecto_bug, ecto_repos: [EctoBug.Repo]

config :ecto_bug, EctoBug.Repo, database: "ecto_bug.db"
