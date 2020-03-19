defmodule TicTacToe.PresenterTest do
  use ExUnit.Case
  alias TicTacToe.Presenter
  alias TicTacToe.BoardInspect

  defmodule BoardWithThreeX do
    defstruct [:position_value]

    defimpl BoardInspect do
      def get(board, position) do
        position_value = if Enum.member?([1, 2, 3], position), do: "X"
        %{board | position_value: position_value}
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
