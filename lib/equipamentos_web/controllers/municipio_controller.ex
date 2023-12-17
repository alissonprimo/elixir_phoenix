defmodule EquipamentosWeb.MunicipioController do
  use EquipamentosWeb, :controller

  alias Equipamentos.Municipios
  alias Equipamentos.Municipios.Municipio

  action_fallback EquipamentosWeb.FallbackController

  def index(conn, _params) do
    municipios = Municipios.list_municipios()
    render(conn, :index, municipios: municipios)
  end

  def create(conn, %{"municipio" => municipio_params}) do
    IO.inspect(municipio_params)

    with {:ok, %Municipio{} = municipio} <- Municipios.create_municipio(municipio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/municipios/#{municipio}")
      |> render(:show, municipio: municipio)
    end
  end

  def show(conn, %{"id" => id}) do
    municipio = Municipios.get_municipio!(id)
    render(conn, :show, municipio: municipio)
  end

  def update(conn, %{"id" => id, "municipio" => municipio_params}) do
    municipio = Municipios.get_municipio!(id)

    with {:ok, %Municipio{} = municipio} <-
           Municipios.update_municipio(municipio, municipio_params) do
      render(conn, :show, municipio: municipio)
    end
  end

  def delete(conn, %{"id" => id}) do
    municipio = Municipios.get_municipio!(id)

    with {:ok, %Municipio{}} <- Municipios.delete_municipio(municipio) do
      send_resp(conn, :no_content, "")
    end
  end
end
