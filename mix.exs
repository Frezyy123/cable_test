defmodule CableTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :cable_test,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :dev,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
      # mod: {CableTest.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:logger_file_backend, "~> 0.0.10"},
      # {:cables, git: "git@github.com:VinogradovAlexandr/cables.git"}
      {:cables, "~> 0.2.1"},
      {:jason, "~> 1.1"},
      {:metal, "~> 0.1.1", github: "lpgauth/metal", override: true},
      {:buoy, "~> 0.2.1", github: "lpgauth/buoy"},
      {:benchee, "~> 0.9", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
