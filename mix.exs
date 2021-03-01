defmodule ElixirLokaliseApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_lokalise_api,
      version: "0.1.0",
      elixir: "~> 1.2",
      name: "ElixirLokaliseApi",
      description: "",
      source_url: "https://github.com/",
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, ">= 0.9.0"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.23", only: [:dev, :test]}
    ]
  end

  def docs do
    [
      readme: "README.md",
      main: ElixirLokaliseApi
    ]
  end

  defp package do
    [
      maintainers: ["Ilya Bodrov-Krukowski"],
      licenses: [""],
      links: %{
        "Github" => "https://github.com/"
      }
    ]
  end
end
