defmodule FarmQ.Repo do
  use Ecto.Repo,
    otp_app: :farmq,
    adapter: Ecto.Adapters.Postgres
end
