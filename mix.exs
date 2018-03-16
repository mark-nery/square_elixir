defmodule SquareElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :square_elixir,
     version: "0.1.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  def description do
    """
    Package for accessing square's V1 API
    """
  end

  defp package do
    [
      name: :square_elixir,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Mark Nery"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/mark-nery/square_elixir"}
    ]
  end

  defp deps do
    [{:httpoison, "~> 0.10.0"},
     {:poison, "~> 3.0"},
     {         :ex_doc, ">= 0.0.0", only: :dev}]
  end
end
