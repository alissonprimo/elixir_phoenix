defmodule Equipamentos.Municipios do
  @moduledoc """
  The Municipios context.
  """

  import Ecto.Query, warn: false
  alias Equipamentos.Repo

  alias Equipamentos.Municipios.Municipio

  @doc """
  Returns the list of municipios.

  ## Examples

      iex> list_municipios()
      [%Municipio{}, ...]

  """
  def list_municipios do
    Repo.all(Municipio)
  end

  @doc """
  Gets a single municipio.

  Raises `Ecto.NoResultsError` if the Municipio does not exist.

  ## Examples

      iex> get_municipio!(123)
      %Municipio{}

      iex> get_municipio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_municipio!(id), do: Repo.get!(Municipio, id)

  @doc """
  Creates a municipio.

  ## Examples

      iex> create_municipio(%{field: value})
      {:ok, %Municipio{}}

      iex> create_municipio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_municipio(attrs \\ %{}) do
    %Municipio{}
    |> Municipio.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a municipio.

  ## Examples

      iex> update_municipio(municipio, %{field: new_value})
      {:ok, %Municipio{}}

      iex> update_municipio(municipio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_municipio(%Municipio{} = municipio, attrs) do
    municipio
    |> Municipio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a municipio.

  ## Examples

      iex> delete_municipio(municipio)
      {:ok, %Municipio{}}

      iex> delete_municipio(municipio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_municipio(%Municipio{} = municipio) do
    Repo.delete(municipio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking municipio changes.

  ## Examples

      iex> change_municipio(municipio)
      %Ecto.Changeset{data: %Municipio{}}

  """
  def change_municipio(%Municipio{} = municipio, attrs \\ %{}) do
    Municipio.changeset(municipio, attrs)
  end
end
