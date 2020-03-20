defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate

  test "gets the board's value at the given position" do
    assert BoardInspect.get(%Board{board_state: [1, 2, 3]}, 1).position_value ==
             1
  end

  test "places the token at the position on the board" do
    token = "X"

    assert BoardUpdate.place_token(
             %Board{board_state: [nil, nil, nil]},
             1,
             token
           ).board_state ==
             [token, nil, nil]
  end

  test "game over is true if there are no available spaces on the board" do
    assert BoardUpdate.place_token(%Board{board_state: [nil, "X", "O"]}, 1, "X").game_over ==
             true
  end

  test "game over is false if there is an available space on the board" do
    assert BoardUpdate.place_token(%Board{board_state: ["X", nil, nil]}, 2, "O").game_over ==
             false
  end
end
