defmodule SquareElixir.Payments do
  import SquareElixir.Base

  def list(location_id, token, begin_time: begin_time, end_time: end_time) do
    get("#{location_id}/payments?begin_time=#{begin_time}&end_time=#{end_time}", token)
  end
  
  def money_report_total(payments_list,type) do
    Enum.map(payments_list,fn(x) -> x["#{type}_money"]["amount"] end)
    |> Enum.sum
  end
end
