defmodule Workouty.UserTest do
  use Workouty.DataCase, async: true

  alias Workouty.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "John Doe", email: "johndoe@email.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{email: "johndoe@email.com", name: "John Doe", password: "123456"},
        errors: []
        } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "J", password: "123456"}

      response = User.changeset(params)

      expected_response = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end
