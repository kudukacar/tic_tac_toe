defmodule TicTacToe.PresenterTest do
  use ExUnit.Case
  alias TicTacToe.Presenter
  alias TicTacToe.BoardInspect

  defmodule BoardWithThreeX do
    defstruct []

    defimpl BoardInspect do
      def get(_board, position) do
        if Enum.member?([1, 2, 3], position), do: "X"
      end
    end
  end

  test "formats the board" do
    spaces = "   "

    expected_grid = """

     X | X | X 
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}

    """

    assert Presenter.present(%BoardWithThreeX{}) == expected_grid
  end
end
