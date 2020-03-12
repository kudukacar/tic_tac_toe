defmodule TicTacToe.PresenterTest do
  use ExUnit.Case
  alias TicTacToe.Presenter

  defmodule BoardWithOnlyNil do
    def get(_grid, _position) do
      nil
    end
  end

  test "formats the board" do
    grid = []
    spaces = "   "
    board = BoardWithOnlyNil

    expected_grid = """

    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}

    """

    assert Presenter.present(grid, board) == expected_grid
  end
end
