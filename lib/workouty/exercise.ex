defmodule Workouty.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Workouty.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:name, :video_url, :protocol_description, :repetitions]

  schema "exercises" do
    field :name, :string
    field :video_url, :string
    field :protocol_description, :string
    field :repetitions, :string

    belongs_to :training, Training

    timestamps()
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
