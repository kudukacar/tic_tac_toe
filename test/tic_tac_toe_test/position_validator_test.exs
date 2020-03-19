defmodule TicTacToe.PositionValidatorTest do
  use ExUnit.Case
  alias TicTacToe.PositionValidator
  alias TicTacToe.BoardState

  defmodule BoardWithTwoAvailable do
    defstruct [:available_positions]

    defimpl BoardState do
      def available_positions(board) do
        %{board | available_positions: [2]}
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
