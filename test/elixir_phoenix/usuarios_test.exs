defmodule ElixirPhoenix.UsuariosTest do
  use ElixirPhoenix.DataCase

  alias ElixirPhoenix.Usuarios

  describe "usuarios" do
    alias ElixirPhoenix.Usuarios.Usuario

    import ElixirPhoenix.UsuariosFixtures

    @invalid_attrs %{nome_completo: nil, cpf: nil, email: nil, telefone: nil, lotacao: nil, nome_funcional: nil}

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      valid_attrs = %{nome_completo: "some nome_completo", cpf: "some cpf", email: "some email", telefone: "some telefone", lotacao: "some lotacao", nome_funcional: "some nome_funcional"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(valid_attrs)
      assert usuario.nome_completo == "some nome_completo"
      assert usuario.cpf == "some cpf"
      assert usuario.email == "some email"
      assert usuario.telefone == "some telefone"
      assert usuario.lotacao == "some lotacao"
      assert usuario.nome_funcional == "some nome_funcional"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      update_attrs = %{nome_completo: "some updated nome_completo", cpf: "some updated cpf", email: "some updated email", telefone: "some updated telefone", lotacao: "some updated lotacao", nome_funcional: "some updated nome_funcional"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.update_usuario(usuario, update_attrs)
      assert usuario.nome_completo == "some updated nome_completo"
      assert usuario.cpf == "some updated cpf"
      assert usuario.email == "some updated email"
      assert usuario.telefone == "some updated telefone"
      assert usuario.lotacao == "some updated lotacao"
      assert usuario.nome_funcional == "some updated nome_funcional"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end
end
