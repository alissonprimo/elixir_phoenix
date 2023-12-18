defmodule ElixirPhoenix.UsuariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirPhoenix.Usuarios` context.
  """

  @doc """
  Generate a usuario.
  """
  def usuario_fixture(attrs \\ %{}) do
    {:ok, usuario} =
      attrs
      |> Enum.into(%{
        cpf: "some cpf",
        email: "some email",
        lotacao: "some lotacao",
        nome_completo: "some nome_completo",
        nome_funcional: "some nome_funcional",
        telefone: "some telefone"
      })
      |> ElixirPhoenix.Usuarios.create_usuario()

    usuario
  end
end
