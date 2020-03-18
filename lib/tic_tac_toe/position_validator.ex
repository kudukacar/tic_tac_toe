defmodule TicTacToe.PositionValidator do
  alias TicTacToe.Board

  def error(position, board) do
    cond do
      Enum.member?(1..9, position) == false ->
        "Invalid entry."

      Board.available_positions(board) |> Enum.member?(position) == false ->
        "Selection taken."

      true ->
        nil
    end
  end
end
