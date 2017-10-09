defmodule BasicAuthScaffold.Mixfile do
  use Mix.Project

  def project do
    [
      app: :basic_auth_scaffold,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {BasicAuthScaffold.Application, []}
    ]
  end

  defp deps do
    [
      {:basic_auth, path: "../basic_auth"},
    ]
  end
end
