defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "gets the board's value at the given position" do
    board = [1, 2, 3]

    assert Board.get(board, 1) == 1
  end

  test "places the token at the position on the board" do
    board = [nil, nil, nil]
    token = "X"

    assert Board.place_token(board, 1, token) == [token, nil, nil]
  end

  test "returns all available positions" do
    board = ["X", nil, nil]

    assert Board.available_positions(board) == [2, 3]
  end
end
