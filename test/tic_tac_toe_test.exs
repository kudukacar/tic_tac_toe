defmodule TicTacToeTest do
  use ExUnit.Case

  defmodule FakePresenter do
    def present(grid, _board) do
      grid_representation =
        Enum.map(grid, fn cell_value -> cell_value || "-" end)

      Enum.join(grid_representation)
    end
  end

  defmodule BoardWithEmptyGrid do
    def empty_grid do
      [nil, nil, nil]
    end
  end

  defmodule FakeDisplay do
    def output(message) do
      message
    end
  end

  test "shows the board" do
    expected_grid = "---"
    board = BoardWithEmptyGrid
    display = FakeDisplay
    presenter = FakePresenter

    assert TicTacToe.run(board, display, presenter) == expected_grid
  end
end
