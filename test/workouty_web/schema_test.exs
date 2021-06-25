defmodule Workouty.SchemaTest do
  use WorkoutyWeb.ConnCase, async: true

  alias Workouty.User
  alias Workouty.User.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "John Doe", email: "johndoe@email.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      {
        user(id: "#{user_id}") {
          email
          id
          name
          trainings {
            id
            startDate
            endDate
            exercises {
              name
              repetitions
            }
          }
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{"data" => %{"user" => %{"email" => "johndoe@email.com", "id" => user_id, "name" => "John Doe", "trainings" => []}}}

      assert expected_response == response
    end

    test "when an invalid id is given, returns an error", %{conn: conn} do
      query = """
      {
        user(id: "d25107d4-4642-4157-9c88-760ae5d504d3") {
          email
          id
          name
          trainings {
            id
            startDate
            endDate
            exercises {
              name
              repetitions
            }
          }
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{"data" => %{"user" => nil}, "errors" => [%{"locations" => [%{"column" => 3, "line" => 2}], "message" => "Invalid UUID", "path" => ["user"]}]}

      assert expected_response == response
    end
  end

  describe "users mutation" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          user(input: {name: "John doe", email: "johndoe@gmail.com", password: "123456"}) {
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"user" => %{"id" => _id, "name" => "John doe"}}} = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      mutation = """
        mutation {
          user(input: {name: "John doe", password: "123456"}) {
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      expected_response = %{"errors" => [%{"locations" => [%{"column" => 10, "line" => 2}], "message" => "Argument \"input\" has invalid value {name: \"John doe\", password: \"123456\"}.\nIn field \"email\": Expected type \"String!\", found null."}]}

      assert response == expected_response
    end
  end
end
