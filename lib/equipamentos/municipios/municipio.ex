defmodule Equipamentos.Municipios.Municipio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "municipios" do
    field :uf_codigo_ibge, :string
    field :uf_descricao, :string
    field :uf_sigla, :string
    field :municipio_codigo_ibge, :string
    field :municipio_nome, :string

    timestamps()
  end

  @doc false
  def changeset(municipio, attrs) do
    municipio
    |> cast(attrs, [
      :uf_codigo_ibge,
      :uf_descricao,
      :uf_sigla,
      :municipio_codigo_ibge,
      :municipio_nome
    ])
    |> validate_required([
      :uf_codigo_ibge,
      :uf_descricao,
      :uf_sigla,
      :municipio_codigo_ibge,
      :municipio_nome
    ])
  end
end
