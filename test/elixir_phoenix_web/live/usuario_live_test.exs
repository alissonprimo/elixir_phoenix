defmodule ElixirPhoenixWeb.UsuarioLiveTest do
  use ElixirPhoenixWeb.ConnCase

  import Phoenix.LiveViewTest
  import ElixirPhoenix.UsuariosFixtures

  @create_attrs %{nome_completo: "some nome_completo", cpf: "some cpf", email: "some email", telefone: "some telefone", lotacao: "some lotacao", nome_funcional: "some nome_funcional"}
  @update_attrs %{nome_completo: "some updated nome_completo", cpf: "some updated cpf", email: "some updated email", telefone: "some updated telefone", lotacao: "some updated lotacao", nome_funcional: "some updated nome_funcional"}
  @invalid_attrs %{nome_completo: nil, cpf: nil, email: nil, telefone: nil, lotacao: nil, nome_funcional: nil}

  defp create_usuario(_) do
    usuario = usuario_fixture()
    %{usuario: usuario}
  end

  describe "Index" do
    setup [:create_usuario]

    test "lists all usuarios", %{conn: conn, usuario: usuario} do
      {:ok, _index_live, html} = live(conn, ~p"/usuarios")

      assert html =~ "Listing Usuarios"
      assert html =~ usuario.nome_completo
    end

    test "saves new usuario", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/usuarios")

      assert index_live |> element("a", "New Usuario") |> render_click() =~
               "New Usuario"

      assert_patch(index_live, ~p"/usuarios/new")

      assert index_live
             |> form("#usuario-form", usuario: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#usuario-form", usuario: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/usuarios")

      html = render(index_live)
      assert html =~ "Usuario created successfully"
      assert html =~ "some nome_completo"
    end

    test "updates usuario in listing", %{conn: conn, usuario: usuario} do
      {:ok, index_live, _html} = live(conn, ~p"/usuarios")

      assert index_live |> element("#usuarios-#{usuario.id} a", "Edit") |> render_click() =~
               "Edit Usuario"

      assert_patch(index_live, ~p"/usuarios/#{usuario}/edit")

      assert index_live
             |> form("#usuario-form", usuario: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#usuario-form", usuario: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/usuarios")

      html = render(index_live)
      assert html =~ "Usuario updated successfully"
      assert html =~ "some updated nome_completo"
    end

    test "deletes usuario in listing", %{conn: conn, usuario: usuario} do
      {:ok, index_live, _html} = live(conn, ~p"/usuarios")

      assert index_live |> element("#usuarios-#{usuario.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#usuarios-#{usuario.id}")
    end
  end

  describe "Show" do
    setup [:create_usuario]

    test "displays usuario", %{conn: conn, usuario: usuario} do
      {:ok, _show_live, html} = live(conn, ~p"/usuarios/#{usuario}")

      assert html =~ "Show Usuario"
      assert html =~ usuario.nome_completo
    end

    test "updates usuario within modal", %{conn: conn, usuario: usuario} do
      {:ok, show_live, _html} = live(conn, ~p"/usuarios/#{usuario}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Usuario"

      assert_patch(show_live, ~p"/usuarios/#{usuario}/show/edit")

      assert show_live
             |> form("#usuario-form", usuario: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#usuario-form", usuario: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/usuarios/#{usuario}")

      html = render(show_live)
      assert html =~ "Usuario updated successfully"
      assert html =~ "some updated nome_completo"
    end
  end
end
