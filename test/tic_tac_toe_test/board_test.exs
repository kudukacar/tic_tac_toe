defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "gets the board's value at the given position" do
    board = [1, 2, 3]

    assert Board.get(board, 1) == 1
  end
end
