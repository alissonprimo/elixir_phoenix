defmodule Equipamentos.Repo do
  use Ecto.Repo,
    otp_app: :equipamentos,
    adapter: Ecto.Adapters.Postgres
end
