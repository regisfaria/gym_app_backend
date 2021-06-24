defmodule WorkoutyWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Logic exercise representation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Exercise name"
    field :video_url, non_null(:string), description: "Exercise video url"
    field :protocol_description, non_null(:string), description: "Exercise protocol description"
    field :repetitions, non_null(:string), description: "Exercise repetitions"
  end
end
