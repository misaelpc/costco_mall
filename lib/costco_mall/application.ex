defmodule CostcoMall.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CostcoMall.PromEx,
      CostcoMall.Repo,
      # Start the Telemetry supervisor
      CostcoMallWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CostcoMall.PubSub},
      # Start the Endpoint (http/https)
      CostcoMallWeb.Endpoint
      # Start a worker by calling: CostcoMall.Worker.start_link(arg)
      # {CostcoMall.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CostcoMall.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CostcoMallWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
