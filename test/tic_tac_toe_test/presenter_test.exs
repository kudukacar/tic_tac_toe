defmodule TicTacToe.PresenterTest do
  use ExUnit.Case
  alias TicTacToe.Presenter
  alias TicTacToe.BoardInspect

  defmodule BoardWithThreeX do
    defstruct status: :in_progress, winner: nil, outcome: {:in_progress, nil}

    defimpl BoardInspect do
      def get(_board, position) do
        if Enum.member?([1, 2, 3], position), do: "X"
      end

      def size(_board) do
        9
      end

      def row_length(_board) do
        3
      end

      def outcome(board) do
        board.outcome
      end
    end
  end

  test "shows only the board when there is no outcome" do
    spaces = "   "

    expected_grid = """

     X | X | X 
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}

    """

    expected_outcome = ""

    assert Presenter.present(%BoardWithThreeX{}) ==
             expected_grid <> expected_outcome
  end

  test "shows the board and outcome when there is a winner" do
    spaces = "   "

    expected_grid = """

     X | X | X 
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}

    """

    expected_outcome = "X wins!"

    assert Presenter.present(%BoardWithThreeX{
             status: :win,
             winner: "X",
             outcome: {:win, "X"}
           }) ==
             expected_grid <> expected_outcome
  end

  test "shows the board and outcome when there is a draw" do
    spaces = "   "

    expected_grid = """

     X | X | X 
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}
    ---+---+---
    #{spaces}|#{spaces}|#{spaces}

    """

    expected_outcome = "Draw!"

    assert Presenter.present(%BoardWithThreeX{
             status: :draw,
             outcome: {:draw, nil}
           }) ==
             expected_grid <> expected_outcome
  end
end
