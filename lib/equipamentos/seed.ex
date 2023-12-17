defmodule Equipamentos.Seed do
  alias Equipamentos.Repo
  alias Equipamentos.Municipios.Municipio

  def run do
    {:ok, data} = File.read("municipios.csv")

    data
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.each(fn {line, index} ->
      if index > 0 do
        process_line(line)
      end
    end)
  end

  defp process_line(line) do
    [uf_codigo_ibge, uf_descricao, uf_sigla, municipio_codigo_ibge, municipio_nome] =
      String.split(line, ",")

    %Municipio{
      uf_codigo_ibge: to_up_and_normalize(uf_codigo_ibge),
      uf_descricao: to_up_and_normalize(uf_descricao),
      uf_sigla: to_up_and_normalize(uf_sigla),
      municipio_codigo_ibge: to_up_and_normalize(municipio_codigo_ibge),
      municipio_nome: to_up_and_normalize(municipio_nome)
    }
    |> Repo.insert!()
  end

  defp to_up_and_normalize(str) do
    str
    |> String.upcase()
    |> String.normalize(:nfd)
    |> String.replace(~r/[^a-zA-Z0-9\s]/, "")
  end
end
