defmodule BasicAuthScaffold.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      supervisor(UnamePasswordRouter, []),
      supervisor(CallbackRouter, []),
      supervisor(TokenOnlyRouter, []),
    ]

    opts = [strategy: :one_for_one, name: BasicAuthScaffold.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
