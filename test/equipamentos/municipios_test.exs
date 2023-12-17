defmodule Equipamentos.MunicipiosTest do
  use Equipamentos.DataCase

  alias Equipamentos.Municipios

  describe "municipios" do
    alias Equipamentos.Municipios.Municipio

    import Equipamentos.MunicipiosFixtures

    @invalid_attrs %{uf_codigo_ibge: nil, uf_descricao: nil, uf_sigla: nil, municipio_codigo_ibge: nil, municipio_nome: nil}

    test "list_municipios/0 returns all municipios" do
      municipio = municipio_fixture()
      assert Municipios.list_municipios() == [municipio]
    end

    test "get_municipio!/1 returns the municipio with given id" do
      municipio = municipio_fixture()
      assert Municipios.get_municipio!(municipio.id) == municipio
    end

    test "create_municipio/1 with valid data creates a municipio" do
      valid_attrs = %{uf_codigo_ibge: 42, uf_descricao: "some uf_descricao", uf_sigla: "some uf_sigla", municipio_codigo_ibge: "some municipio_codigo_ibge", municipio_nome: "some municipio_nome"}

      assert {:ok, %Municipio{} = municipio} = Municipios.create_municipio(valid_attrs)
      assert municipio.uf_codigo_ibge == 42
      assert municipio.uf_descricao == "some uf_descricao"
      assert municipio.uf_sigla == "some uf_sigla"
      assert municipio.municipio_codigo_ibge == "some municipio_codigo_ibge"
      assert municipio.municipio_nome == "some municipio_nome"
    end

    test "create_municipio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Municipios.create_municipio(@invalid_attrs)
    end

    test "update_municipio/2 with valid data updates the municipio" do
      municipio = municipio_fixture()
      update_attrs = %{uf_codigo_ibge: 43, uf_descricao: "some updated uf_descricao", uf_sigla: "some updated uf_sigla", municipio_codigo_ibge: "some updated municipio_codigo_ibge", municipio_nome: "some updated municipio_nome"}

      assert {:ok, %Municipio{} = municipio} = Municipios.update_municipio(municipio, update_attrs)
      assert municipio.uf_codigo_ibge == 43
      assert municipio.uf_descricao == "some updated uf_descricao"
      assert municipio.uf_sigla == "some updated uf_sigla"
      assert municipio.municipio_codigo_ibge == "some updated municipio_codigo_ibge"
      assert municipio.municipio_nome == "some updated municipio_nome"
    end

    test "update_municipio/2 with invalid data returns error changeset" do
      municipio = municipio_fixture()
      assert {:error, %Ecto.Changeset{}} = Municipios.update_municipio(municipio, @invalid_attrs)
      assert municipio == Municipios.get_municipio!(municipio.id)
    end

    test "delete_municipio/1 deletes the municipio" do
      municipio = municipio_fixture()
      assert {:ok, %Municipio{}} = Municipios.delete_municipio(municipio)
      assert_raise Ecto.NoResultsError, fn -> Municipios.get_municipio!(municipio.id) end
    end

    test "change_municipio/1 returns a municipio changeset" do
      municipio = municipio_fixture()
      assert %Ecto.Changeset{} = Municipios.change_municipio(municipio)
    end
  end
end
