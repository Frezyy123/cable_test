defmodule CableTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    {module, params} =
      Cables.child_spec(CableTest, "http://example.org/")

    children = [
      %{
        id: {CableTest, make_ref()},
        start: {module, :start_link, [params]}
      }
      # Starts a worker by calling: CableTest.Worker.start_link(arg)
      # {CableTest.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CableTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
