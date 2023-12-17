defmodule Equipamentos.Repo.Migrations.CreateMunicipios do
  use Ecto.Migration

  def change do
    create table(:municipios) do
      add :uf_codigo_ibge, :integer
      add :uf_descricao, :string
      add :uf_sigla, :string
      add :municipio_codigo_ibge, :string
      add :municipio_nome, :string

      timestamps()
    end
  end
end
