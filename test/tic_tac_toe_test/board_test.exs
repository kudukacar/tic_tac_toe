defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "creates an empty list of length 9" do
    grid = Board.empty_grid()

    assert length(grid) == 9
    assert Enum.all?(grid, fn x -> x == nil end) == true
  end

  test "gets the board's value at the given position" do
    grid = [1, 2, 3]

    assert Board.get(grid, 1) == 1
  end
end
