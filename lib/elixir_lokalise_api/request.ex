defmodule ElixirLokaliseApi.Request do
  use HTTPoison.Base

  alias ElixirLokaliseApi.Config
  alias ElixirLokaliseApi.Processor
  alias ElixirLokaliseApi.UrlGenerator
  alias __MODULE__

  @defaults [ body: nil, type: nil, id: nil, url_params: Keyword.new(), query_params: Keyword.new() ]

  def get(module, opts \\ []), do: do_request(:get, module, opts)

  def post(module, opts \\ []), do: do_request(:post, module, opts)

  def put(module, opts \\ []), do: do_request(:put, module, opts)

  def delete(module, opts \\ []), do: do_request(:delete, module, opts)

  defp do_request(verb, module, opts) do
    opts = opts |> prepare_opts()
    # https://github.com/edgurgel/httpoison/blob/a4a7877/lib/httpoison/base.ex#L135
    Request.request!(
      verb,
      UrlGenerator.generate(module, opts),
      Processor.encode(opts[:data]),
      headers(),
      [ params: opts[:query_params] ]
    )
    |> Processor.parse(module, opts[:type])
  end

  defp headers() do
    [
      "X-Api-Token": Config.api_token,
      "Accept": "application/json",
      "User-Agent": "elixir-lokalise-api package/#{Config.version}"
    ]
  end

  defp prepare_opts(opts) do
    Keyword.merge @defaults, opts
  end
end
