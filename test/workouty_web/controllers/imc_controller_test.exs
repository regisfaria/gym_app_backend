defmodule WorkoutyWeb.IMCControllerTest do
  use WorkoutyWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the IMC info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      expected_response = %{"result" => %{"Giorgio" => 23.38868655818771, "Glauber" => 29.757584555087824, "Mariana" => 23.437499999999996, "Regis" => 25.762980578676178}}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "non-existing.csv"}

      expected_response = %{"result" => "Error while opening the file"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
