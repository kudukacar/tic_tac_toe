defmodule TicTacToe.PositionValidator do
  alias TicTacToe.BoardInspect

  def error(position, board) do
    board = BoardInspect.get(board, position)

    cond do
      Enum.member?(1..9, position) == false ->
        "Invalid entry."

      board.position_value ->
        "Selection taken."

      true ->
        nil
    end
  end
end
