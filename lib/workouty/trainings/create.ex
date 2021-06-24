defmodule Workouty.Trainings.Create do
  alias Workouty.{Repo, Training}

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
