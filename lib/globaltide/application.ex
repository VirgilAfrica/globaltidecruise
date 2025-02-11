defmodule Globaltide.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GlobaltideWeb.Telemetry,
      Globaltide.Repo,
      {DNSCluster, query: Application.get_env(:globaltide, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Globaltide.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Globaltide.Finch},
      # Start a worker by calling: Globaltide.Worker.start_link(arg)
      # {Globaltide.Worker, arg},
      # Start to serve requests, typically the last entry
      GlobaltideWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Globaltide.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlobaltideWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
