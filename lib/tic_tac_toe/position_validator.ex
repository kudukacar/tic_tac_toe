defmodule TicTacToe.PositionValidator do
  alias TicTacToe.BoardInspect

  def error(position, board) do
    {number_of_positions, _} = BoardInspect.size(board)

    cond do
      Enum.member?(1..number_of_positions, position) == false ->
        "Invalid entry."

      BoardInspect.get(board, position) ->
        "Selection taken."

      true ->
        nil
    end
  end
end
