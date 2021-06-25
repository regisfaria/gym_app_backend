defmodule Workouty.IMCTest do
  use ExUnit.Case, async: true

  alias Workouty.IMC

  describe "calculate/1" do
    test "when the file exists, returns it's data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
          %{
            "Giorgio" => 23.38868655818771,
            "Glauber" => 29.757584555087824,
            "Mariana" => 23.437499999999996,
            "Regis" => 25.762980578676178
          }
        }

      assert response == expected_response
    end

    test "when the file does not exists, returns an error" do
      params = %{"filename" => "non-existing.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
