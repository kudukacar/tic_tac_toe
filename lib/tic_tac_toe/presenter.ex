defmodule TicTacToe.Presenter do
  alias TicTacToe.BoardInspect

  def present(board) do
    size = BoardInspect.size(board)
    row_length = size |> :math.sqrt() |> trunc()

    displayed_board =
      Enum.to_list(1..size)
      |> Enum.map(fn x ->
        value = BoardInspect.get(board, x) || " "

        cond do
          x == 1 ->
            "\n #{value} |"

          rem(x, row_length) == 0 && x != size ->
            " #{value} \n#{row_lines(row_length)}"

          x == size ->
            " #{value} \n\n"

          true ->
            " #{value} |"
        end
      end)
      |> Enum.join()

    displayed_board <> display_outcome(board)
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
