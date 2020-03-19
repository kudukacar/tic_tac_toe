defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardState
  alias TicTacToe.BoardOutcome

  test "gets the board's value at the given position" do
    assert BoardInspect.get(%Board{board: [1, 2, 3]}, 1).position_value == 1
  end

  test "places the token at the position on the board" do
    token = "X"

    assert BoardUpdate.place_token(%Board{board: [nil, nil, nil]}, 1, token).board ==
             [token, nil, nil]
  end

  test "returns all available positions" do
    assert BoardState.available_positions(%Board{board: ["X", nil, nil]}).available_positions ==
             [2, 3]
  end

  test "returns true if there are no available spaces on the board" do
    assert BoardOutcome.game_over?(%Board{board: ["X", "O"]}).game_over == true
  end

  test "returns false if there is an available space on the board" do
    assert BoardOutcome.game_over?(%Board{board: ["X", nil]}).game_over == false
  end
end
