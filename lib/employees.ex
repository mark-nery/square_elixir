defmodule SquareElixir.Employees do
  import SquareElixir.Base

  def active_employees(token) do
    get("me/employees?status=ACTIVE", token)
  end
end
