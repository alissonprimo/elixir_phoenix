defmodule ElixirPhoenix.Usuarios.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuarios" do
    field :nome_completo, :string
    field :cpf, :string
    field :email, :string
    field :telefone, :string
    field :lotacao, :string
    field :nome_funcional, :string

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome_completo, :cpf, :email, :telefone, :lotacao, :nome_funcional])
    |> validate_required([:nome_completo, :cpf, :email, :telefone, :lotacao, :nome_funcional])
  end
end
