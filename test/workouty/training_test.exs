defmodule Workouty.TrainingTest do
  use Workouty.DataCase, async: true

  alias Workouty.Training

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params =
        %{
          end_date: "2021-11-05",
          start_date: "2021-12-05",
          user_id: "someone-else-id",
          exercises: [%{
            name: "Triceps Banco",
            protocol_description: "Use dois bancos e tente focar no triceps",
            video_url: "www.google.com",
            repetitions: "3x12"
          }, %{
            name: "Triceps corda",
            protocol_description: "Muitas reps",
            video_url: "www.google.com",
            repetitions: "6x12"
          }]
        }

      response = Training.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        errors: []
        } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params =
        %{
          end_date: "2021-11-05",
          start_date: "2021-12-05",
        }

      response = Training.changeset(params)

      expected_response = %{user_id: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
