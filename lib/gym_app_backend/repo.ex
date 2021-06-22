defmodule GymAppBackend.Repo do
  use Ecto.Repo,
    otp_app: :gym_app_backend,
    adapter: Ecto.Adapters.Postgres
end
