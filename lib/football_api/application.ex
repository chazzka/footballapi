defmodule FootballApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FootballApiWeb.Telemetry,
      FootballApi.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:football_api, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:football_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FootballApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FootballApi.Finch},
      # Start a worker by calling: FootballApi.Worker.start_link(arg)
      # {FootballApi.Worker, arg},
      # Start to serve requests, typically the last entry
      FootballApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FootballApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FootballApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
