defmodule TicTacToeTest do
  use ExUnit.Case

  defmodule HyphenPresenter do
    def present(board) do
      board |> Enum.map(fn cell_value -> cell_value || "-" end) |> Enum.join()
    end
  end

  defmodule DisplayWithOutput do
    def output(message) do
      message
    end
  end

  test "shows the board" do
    expected_grid = "---"
    board = [nil, nil, nil]

    assert TicTacToe.run(
             board: board,
             display: DisplayWithOutput,
             presenter: HyphenPresenter
           ) == expected_grid
  end
end
