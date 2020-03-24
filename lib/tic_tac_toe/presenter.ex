defmodule TicTacToe.Presenter do
  alias TicTacToe.BoardInspect

  def present(board) do
    number_of_positions = BoardInspect.size(board)
    row_length = BoardInspect.row_length(board)

    displayed_board =
      format_cells(row_length, number_of_positions, board) |> Enum.join()

    "\n#{displayed_board <> display_outcome(board)}"
  end

  defp format_cells(row_length, number_of_positions, board) do
    Enum.to_list(1..number_of_positions)
    |> Enum.map(fn x ->
      value = BoardInspect.get(board, x) || " "

      cond do
        x == number_of_positions ->
          " #{value} \n\n"

        rem(x, row_length) == 0 && x != 1 ->
          " #{value} \n#{row_lines(row_length)}"

        true ->
          " #{value} |"
      end
    end)
  end

  defp display_outcome(board) do
    case BoardInspect.outcome(board) do
      {:win, winner} -> "#{winner} wins!"
      {:draw, _} -> "Draw!"
      _ -> ""
    end
  end

  defp row_lines(row_length) do
    Enum.to_list(1..row_length)
    |> Enum.map(fn x ->
      if x == row_length, do: "---\n", else: "---+"
    end)
    |> Enum.join()
  end
end
