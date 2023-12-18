defmodule ElixirPhoenixWeb.UsuarioLive.Index do
  use ElixirPhoenixWeb, :live_view

  alias ElixirPhoenix.Usuarios
  alias ElixirPhoenix.Usuarios.Usuario

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :usuarios, Usuarios.list_usuarios())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Usuario")
    |> assign(:usuario, Usuarios.get_usuario!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Usuario")
    |> assign(:usuario, %Usuario{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Usuarios")
    |> assign(:usuario, nil)
  end

  @impl true
  def handle_info({ElixirPhoenixWeb.UsuarioLive.FormComponent, {:saved, usuario}}, socket) do
    {:noreply, stream_insert(socket, :usuarios, usuario)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    usuario = Usuarios.get_usuario!(id)
    {:ok, _} = Usuarios.delete_usuario(usuario)

    {:noreply, stream_delete(socket, :usuarios, usuario)}
  end
end
