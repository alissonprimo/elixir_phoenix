defmodule EquipamentosWeb.MunicipioJSON do
  alias Equipamentos.Municipios.Municipio

  @doc """
  Renders a list of municipios.
  """
  def index(%{municipios: municipios}) do
    %{data: for(municipio <- municipios, do: data(municipio))}
  end

  @doc """
  Renders a single municipio.
  """
  def show(%{municipio: municipio}) do
    %{data: data(municipio)}
  end

  defp data(%Municipio{} = municipio) do
    %{
      id: municipio.id,
      uf_codigo_ibge: municipio.uf_codigo_ibge,
      uf_descricao: municipio.uf_descricao,
      uf_sigla: municipio.uf_sigla,
      municipio_codigo_ibge: municipio.municipio_codigo_ibge,
      municipio_nome: municipio.municipio_nome
    }
  end
end
