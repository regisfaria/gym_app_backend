defmodule Workouty.User.Create do
  alias Workouty.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
