defmodule GymAppBackend.User.Create do
  alias GymAppBackend.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
