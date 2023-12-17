defmodule Equipamentos.Repo.Migrations.AlterUserTable do
  use Ecto.Migration

  def change do
    alter table(:municipios) do
      modify :uf_codigo_ibge, :string
    end
  end
end
