defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate

  test "creates a board of the given size" do
    %{board_state: board_state} = Board.new(9)

    assert board_state == [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  test "gets the board's value at the given position" do
    assert BoardInspect.get(%Board{board_state: [1, 2, 3]}, 1) == 1
  end

  test "gets the board's position count" do
    assert BoardInspect.size(Board.new(9)) == 9
  end

  test "gets the board's row length" do
    assert BoardInspect.row_length(Board.new(9)) == 3
  end

  test "when there is a winner, status is win and winner is token" do
    token = "X"

    outcome =
      Board.new(9)
      |> BoardUpdate.place_token({1, token})
      |> BoardUpdate.place_token({2, token})
      |> BoardUpdate.place_token({3, token})
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
      Board.new(9)
      |> BoardUpdate.place_token({2, "X"})
      |> BoardUpdate.place_token({1, "O"})
      |> BoardUpdate.place_token({2, "X"})
      |> BoardInspect.outcome()

    assert outcome == {:in_progress, nil}
  end

  test "places the token at the position on the board" do
    token = "X"

    assert BoardUpdate.place_token(
             Board.new(9),
             {1, token}
           ).board_state ==
             [token, nil, nil, nil, nil, nil, nil, nil, nil]
  end
end
