defmodule TicTacToe.PositionValidator do
  alias TicTacToe.BoardInspect

  def error(position, board) do
    cond do
      Enum.member?(1..9, position) == false ->
        "Invalid entry."

      BoardInspect.get(board, position) ->
        "Selection taken."

      true ->
        nil
    end
  end
end
