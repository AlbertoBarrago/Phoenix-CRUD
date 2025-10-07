defmodule SimpleCrud.Repo do
  use Ecto.Repo,
    otp_app: :simple_crud,
    adapter: Ecto.Adapters.Postgres
end
