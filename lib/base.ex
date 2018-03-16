defmodule SquareElixir.Base do
  def get(endpoint,token) do    
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    url = "https://connect.squareup.com/v1/#{endpoint}"

    {:ok, response} = HTTPoison.get(url, headers)
    
    get_pag_res(pag_link(response),headers,Poison.Parser.parse!(response.body))
  end

  defp get_pag_res([],headers,results), do: results
  
  defp get_pag_res(link,headers,results) do
    {:ok, response} = HTTPoison.get(link, headers)

    get_pag_res(pag_link(response),headers,results ++ Poison.Parser.parse!(response.body))
  end

  def pag_link(response) do
    link = response.headers |> Enum.filter(fn(x) -> elem(x,0) == "Link" end)
    
    if link == [] do
      []
    else
      link
      |> List.first |> elem(1)
      |> (&Regex.run(~r/<(.*)>/,&1)).()
      |> Enum.at(1)
    end
  end
  
end
