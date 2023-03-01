defmodule PermError.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Pow.Store.Backend.MnesiaCache
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: PermError.Supervisor)
  end
end
