defmodule TicTacToe.ParseInputTest do
  use ExUnit.Case
  alias TicTacToe.ParseInput

  test "parses an integer string input to an integer" do
    assert ParseInput.to_integer("4") == 4
  end

  test "returns 0 if the string input does not represent an integer" do
    assert ParseInput.to_integer("0") == 0
  end
end