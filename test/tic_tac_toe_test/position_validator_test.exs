defmodule TicTacToe.PositionValidatorTest do
  use ExUnit.Case
  alias TicTacToe.PositionValidator
  alias TicTacToe.BoardInspect

  defmodule BoardWithTwoAvailable do
    defstruct [:position_value]

    defimpl BoardInspect do
      def get(_board, position) do
        if position != 2, do: "X"
      end

      def size(_board) do
        {9, 3}
      end

      def outcome(_), do: nil
    end
  end

  test "returns an error if the position is not between 1 and the board's size" do
    assert PositionValidator.error(0, %BoardWithTwoAvailable{}) ==
             "Invalid entry."
  end

  test "returns an error if the position is not available" do
    assert PositionValidator.error(1, %BoardWithTwoAvailable{}) ==
             "Selection taken."
  end

  test "returns nil if the position is valid and available" do
    assert PositionValidator.error(2, %BoardWithTwoAvailable{}) == nil
  end
end
