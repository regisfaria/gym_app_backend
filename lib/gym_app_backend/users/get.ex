defmodule GymAppBackend.User.Get do
  alias Ecto.UUID
  alias GymAppBackend.{Repo, User}

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "Invalid UUID"}
      user -> {:ok, user}
    end
  end
end
