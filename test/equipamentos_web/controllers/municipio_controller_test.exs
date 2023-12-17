defmodule EquipamentosWeb.MunicipioControllerTest do
  use EquipamentosWeb.ConnCase

  import Equipamentos.MunicipiosFixtures

  alias Equipamentos.Municipios.Municipio

  @create_attrs %{
    uf_codigo_ibge: 42,
    uf_descricao: "some uf_descricao",
    uf_sigla: "some uf_sigla",
    municipio_codigo_ibge: "some municipio_codigo_ibge",
    municipio_nome: "some municipio_nome"
  }
  @update_attrs %{
    uf_codigo_ibge: 43,
    uf_descricao: "some updated uf_descricao",
    uf_sigla: "some updated uf_sigla",
    municipio_codigo_ibge: "some updated municipio_codigo_ibge",
    municipio_nome: "some updated municipio_nome"
  }
  @invalid_attrs %{uf_codigo_ibge: nil, uf_descricao: nil, uf_sigla: nil, municipio_codigo_ibge: nil, municipio_nome: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all municipios", %{conn: conn} do
      conn = get(conn, ~p"/api/municipios")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create municipio" do
    test "renders municipio when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/municipios", municipio: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/municipios/#{id}")

      assert %{
               "id" => ^id,
               "municipio_codigo_ibge" => "some municipio_codigo_ibge",
               "municipio_nome" => "some municipio_nome",
               "uf_codigo_ibge" => 42,
               "uf_descricao" => "some uf_descricao",
               "uf_sigla" => "some uf_sigla"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/municipios", municipio: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update municipio" do
    setup [:create_municipio]

    test "renders municipio when data is valid", %{conn: conn, municipio: %Municipio{id: id} = municipio} do
      conn = put(conn, ~p"/api/municipios/#{municipio}", municipio: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/municipios/#{id}")

      assert %{
               "id" => ^id,
               "municipio_codigo_ibge" => "some updated municipio_codigo_ibge",
               "municipio_nome" => "some updated municipio_nome",
               "uf_codigo_ibge" => 43,
               "uf_descricao" => "some updated uf_descricao",
               "uf_sigla" => "some updated uf_sigla"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, municipio: municipio} do
      conn = put(conn, ~p"/api/municipios/#{municipio}", municipio: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete municipio" do
    setup [:create_municipio]

    test "deletes chosen municipio", %{conn: conn, municipio: municipio} do
      conn = delete(conn, ~p"/api/municipios/#{municipio}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/municipios/#{municipio}")
      end
    end
  end

  defp create_municipio(_) do
    municipio = municipio_fixture()
    %{municipio: municipio}
  end
end
