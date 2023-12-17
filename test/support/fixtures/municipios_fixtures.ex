defmodule Equipamentos.MunicipiosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Equipamentos.Municipios` context.
  """

  @doc """
  Generate a municipio.
  """
  def municipio_fixture(attrs \\ %{}) do
    {:ok, municipio} =
      attrs
      |> Enum.into(%{
        municipio_codigo_ibge: "some municipio_codigo_ibge",
        municipio_nome: "some municipio_nome",
        uf_codigo_ibge: 42,
        uf_descricao: "some uf_descricao",
        uf_sigla: "some uf_sigla"
      })
      |> Equipamentos.Municipios.create_municipio()

    municipio
  end
end
