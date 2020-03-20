defmodule TicTacToe.PositionValidatorTest do
  use ExUnit.Case
  alias TicTacToe.PositionValidator
  alias TicTacToe.BoardInspect

  defmodule BoardWithTwoAvailable do
    defstruct [:position_value]

    defimpl BoardInspect do
      def get(board, position) do
        position_value = if position == 2, do: nil, else: "X"
        %{board | position_value: position_value}
      end
    end
  end

  test "returns an error if the position is not between 1 and 9" do
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
