defmodule Equipamentos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EquipamentosWeb.Telemetry,
      # Start the Ecto repository
      Equipamentos.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Equipamentos.PubSub},
      # Start Finch
      {Finch, name: Equipamentos.Finch},
      # Start the Endpoint (http/https)
      EquipamentosWeb.Endpoint
      # Start a worker by calling: Equipamentos.Worker.start_link(arg)
      # {Equipamentos.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Equipamentos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EquipamentosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
