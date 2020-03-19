defmodule TicTacToe.PositionValidator do
  alias TicTacToe.BoardState

  def error(position, board) do
    board = BoardState.available_positions(board)

    cond do
      Enum.member?(1..9, position) == false ->
        "Invalid entry."

      board.available_positions |> Enum.member?(position) == false ->
        "Selection taken."

      true ->
        nil
    end
  end
end
