defmodule EctoBug.Repo do
  use Ecto.Repo,
    otp_app: :ecto_bug,
    adapter: Ecto.Adapters.SQLite3
end
