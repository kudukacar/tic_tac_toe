defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate

  test "gets the board's value at the given position" do
    assert BoardInspect.get(%Board{board_state: [1, 2, 3]}, 1) == 1
  end

  test "gets the board's position count and dimension" do
    assert BoardInspect.size(%Board{board_state: List.duplicate(nil, 9)}) ==
             {9, 3}
  end

  test "when there is a winner, status is win and winner is token" do
    outcome =
      %Board{board_state: ["X", "X", "X", nil, nil, nil, nil, nil, nil]}
      |> BoardInspect.outcome()

    assert outcome == {:win, "X"}
  end

  test "when there is a draw, status is draw amd winner is nil" do
    outcome =
      %Board{board_state: ["X", "X", "O", "O", "X", "X", "X", "O", "O"]}
      |> BoardInspect.outcome()

    assert outcome == {:draw, nil}
  end

  test "when there is no winner or draw, status is :in_progress and winner is nil" do
    outcome =
      %Board{board_state: ["O", "X", "X", nil, nil, nil, nil, nil, nil]}
      |> BoardInspect.outcome()

    assert outcome == {:in_progress, nil}
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
end
