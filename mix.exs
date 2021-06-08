defmodule PlugExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_example,
      elixirc_options: elixirc_options(Mix.env()),
      erlc_options: erlc_options(Mix.env()),
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PlugExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.3"},
      {:jason, "~> 1.2"},
      {:excoveralls, "~> 0.13", only: :test},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end

  defp elixirc_options(:prod) do
    [debug_info: false, all_warnings: true, warnings_as_errors: true]
  end

  defp elixirc_options(_) do
    [debug_info: true, all_warnings: true, warnings_as_errors: true]
  end

  defp erlc_options(:prod) do
    [:warnings_as_errors]
  end

  defp erlc_options(_) do
    [:warnings_as_errors, :debug_info]
  end
end
