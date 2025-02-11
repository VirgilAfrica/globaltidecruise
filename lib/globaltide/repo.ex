defmodule Globaltide.Repo do
  use Ecto.Repo,
    otp_app: :globaltide,
    adapter: Ecto.Adapters.Postgres
end
