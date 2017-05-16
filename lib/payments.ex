defmodule SquareElixir.Payments do
  import SquareElixir.Base

  def list(location_id, token, begin_time: begin_time, end_time: end_time) do
    get("#{location_id}/payments?begin_time=#{begin_time}&end_time=#{end_time}", token)
  end

end
