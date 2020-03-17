defmodule TicTacToe.PositionValidator do
  def error(position) do
    range = 1..9

    unless Enum.member?(range, position) do
      "Invalid entry."
    end
  end
end
