defmodule RmqSteams.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: RmqSteams.Worker.start_link(arg)
      # {RmqSteams.Worker, arg}
      {DynamicSupervisor, name: RmqSteams.DynamicSupervisor, strategy: :one_for_one},
      RmqSteams.MyConnection,
      RmqSteams.MyProducer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RmqSteams.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
