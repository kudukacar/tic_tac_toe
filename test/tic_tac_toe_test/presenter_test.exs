defmodule TicTacToe.PresenterTest do
  use ExUnit.Case
  alias TicTacToe.Presenter

  defmodule BoardWithThreeX do
    def get(_grid, position) do
      if Enum.member?([1, 2, 3], position), do: "X"
    end
  end

  test "formats the board" do
    grid = []
    spaces = "   "
    board = BoardWithThreeX

    expected_grid = """

     X | X | X 
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}

    """

    assert Presenter.present(grid, board) == expected_grid
  end
end
