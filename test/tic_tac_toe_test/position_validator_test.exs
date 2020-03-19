defmodule TicTacToe.PositionValidatorTest do
  use ExUnit.Case
  alias TicTacToe.PositionValidator

  test "returns an error if the position is not between 1 and 9" do
    board = ["X", nil]
    assert PositionValidator.error(0, board) == "Invalid entry."
  end

  test "returns an error if the position is not available" do
    board = ["X", nil]
    assert PositionValidator.error(1, board) == "Selection taken."
  end

  test "returns nil if the position is valid and available" do
    board = ["X", nil]
    assert PositionValidator.error(2, board) == nil
  end
end
