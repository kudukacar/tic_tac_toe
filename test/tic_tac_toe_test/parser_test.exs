defmodule TicTacToe.ParserTest do
  use ExUnit.Case
  alias TicTacToe.Parser

  test "parses an integer string to an integer" do
    assert Parser.to_integer("4") == 4
  end

  test "returns 0 if the string does not represent an integer" do
    assert Parser.to_integer("0") == 0
  end
end
