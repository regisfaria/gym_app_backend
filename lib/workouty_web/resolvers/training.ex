defmodule WorkoutyWeb.Resolvers.Training do
  def create(%{input: params}, _context), do: Workouty.Trainings.Create.call(params)
end
