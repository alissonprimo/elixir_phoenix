defmodule ElixirPhoenixWeb.UsuarioLive.Show do
  use ElixirPhoenixWeb, :live_view

  alias ElixirPhoenix.Usuarios

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:usuario, Usuarios.get_usuario!(id))}
  end

  defp page_title(:show), do: "Show Usuario"
  defp page_title(:edit), do: "Edit Usuario"
end
