defmodule WorkoutyWeb.Resolvers.User do
  def create(%{input: params}, _context), do: Workouty.User.Create.call(params)
  def get(%{id: user_id}, _context), do: Workouty.User.Get.call(user_id)
end
