defmodule ElixirPhoenixWeb.UsuarioLive.FormComponent do
  use ElixirPhoenixWeb, :live_component

  alias ElixirPhoenix.Usuarios

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage usuario records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="usuario-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:nome_completo]} type="text" label="Nome completo" />
        <.input field={@form[:cpf]} type="text" label="Cpf" />
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:telefone]} type="text" label="Telefone" />
        <.input field={@form[:lotacao]} type="text" label="Lotacao" />
        <.input field={@form[:nome_funcional]} type="text" label="Nome funcional" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Usuario</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{usuario: usuario} = assigns, socket) do
    changeset = Usuarios.change_usuario(usuario)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"usuario" => usuario_params}, socket) do
    changeset =
      socket.assigns.usuario
      |> Usuarios.change_usuario(usuario_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"usuario" => usuario_params}, socket) do
    save_usuario(socket, socket.assigns.action, usuario_params)
  end

  defp save_usuario(socket, :edit, usuario_params) do
    case Usuarios.update_usuario(socket.assigns.usuario, usuario_params) do
      {:ok, usuario} ->
        notify_parent({:saved, usuario})

        {:noreply,
         socket
         |> put_flash(:info, "Usuario updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_usuario(socket, :new, usuario_params) do
    case Usuarios.create_usuario(usuario_params) do
      {:ok, usuario} ->
        notify_parent({:saved, usuario})

        {:noreply,
         socket
         |> put_flash(:info, "Usuario created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
