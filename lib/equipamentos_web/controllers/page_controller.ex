defmodule EquipamentosWeb.PageController do
  use EquipamentosWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    IO.puts("Users function hit!")

    users = [
      %{
        id: 1,
        name: "John Doe",
        email: "johndoe@email.com"
      },
      %{
        id: 2,
        name: "Molly",
        email: "molly@email.com"
      }
    ]

    json(conn, %{users: users})
  end
end
