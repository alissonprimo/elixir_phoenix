defmodule ElixirPhoenix.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nome_completo, :string
      add :cpf, :string
      add :email, :string
      add :telefone, :string
      add :lotacao, :string
      add :nome_funcional, :string

      timestamps()
    end
  end
end
