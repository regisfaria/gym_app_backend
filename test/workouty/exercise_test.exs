defmodule Workouty.ExerciseTest do
  use Workouty.DataCase, async: true

  alias Workouty.Exercise

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params =
        %{
          name: "Triceps Banco",
          protocol_description: "Use dois bancos e tente focar no triceps",
          video_url: "www.google.com",
          repetitions: "3x12"
        }

      response = Exercise.changeset(%Exercise{}, params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Triceps Banco", protocol_description: "Use dois bancos e tente focar no triceps", repetitions: "3x12", video_url: "www.google.com"},
        errors: []
        } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params =
        %{
          protocol_description: "Use dois bancos e tente focar no triceps",
          repetitions: "3x12"
        }

      response = Exercise.changeset(%Exercise{}, params)

      expected_response = %{name: ["can't be blank"], video_url: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
