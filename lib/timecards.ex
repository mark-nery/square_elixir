defmodule SquareElixir.Timecards do
  import SquareElixir.Base
  def list(token,clockin,clockout) do
    get("me/timecards?begin_clockin_time=#{clockin}&end_clockin_time=#{clockout}&deleted=false", token)
  end
end
