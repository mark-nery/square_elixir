defmodule SquareElixir.Base do
  def get(endpoint,token) do
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    url = "https://connect.squareup.com/v1/#{endpoint}"

    {:ok, response} = HTTPoison.get(url, headers)
    Poison.Parser.parse!(response.body)
  end
end
