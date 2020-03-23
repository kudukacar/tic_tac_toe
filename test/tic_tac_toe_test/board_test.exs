defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate

  test "gets the board's value at the given position" do
    assert BoardInspect.get(%Board{board_state: [1, 2, 3]}, 1) == 1
  end

  test "gets the board's size" do
    assert BoardInspect.size(%Board{board_state: [1, 2, 3]}) == 3
  end

  test "places the token at the position on the board" do
    token = "X"

    assert BoardUpdate.place_token(
             %Board{board_state: List.duplicate(nil, 9)},
             1,
             token
           ).board_state ==
             [token, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  test "when there is a winner, status is win and outcome is token" do
    token = "X"

    outcome =
      %Board{board_state: [nil, "X", "X", nil, nil, nil, nil, nil, nil]}
      |> BoardUpdate.place_token(1, token)
      |> BoardInspect.outcome()

    assert outcome == {:win, token}
  end

  test "when there is a draw, status is draw amd winner is nil" do
    outcome =
      %Board{board_state: ["X", "X", "O", "O", nil, "X", "X", "O", "O"]}
      |> BoardUpdate.place_token(5, "X")
      |> BoardInspect.outcome()

    assert outcome == {:draw, nil}
  end

  test "when there is no winner or draw, status is :in_progress and winner is nil" do
    outcome =
      %Board{board_state: [nil, "X", "X", nil, nil, nil, nil, nil, nil]}
      |> BoardUpdate.place_token(1, "O")
      |> BoardInspect.outcome()

    assert outcome == {:in_progress, nil}
  end
end
