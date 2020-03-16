defmodule TicTacToeTest do
  use ExUnit.Case

  defmodule FakePresenter do
    def present(board) do
      board_representation =
        Enum.map(board, fn cell_value -> cell_value || "-" end)

      Enum.join(board_representation)
    end
  end

  defmodule FakeDisplay do
    def output(message) do
      message
    end
  end

  test "shows the board" do
    expected_grid = "---"
    board = [nil, nil, nil]

    assert TicTacToe.run(
             board: board,
             display: FakeDisplay,
             presenter: FakePresenter
           ) == expected_grid
  end
end
