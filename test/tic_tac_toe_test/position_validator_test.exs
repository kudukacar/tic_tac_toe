defmodule TicTacToe.PositionValidatorTest do
  use ExUnit.Case
  alias TicTacToe.Validator
  alias TicTacToe.PositionValidator

  test "returns an error if the position is not between 1 and 9" do
    assert Validator.error(%PositionValidator{position: 0}) == "Invalid entry."
  end

  test "returns nil if the position is between 1 and 9" do
    assert Validator.error(%PositionValidator{position: 1}) == nil
  end
end