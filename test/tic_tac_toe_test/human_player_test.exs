defmodule TicTacToe.HumanPlayerTest do
  use ExUnit.Case
  alias TicTacToe.Player
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Display

  defmodule ParserWithOne do
    def to_integer(position) do
      String.to_integer(position)
    end
  end

  defmodule ValidatorWithOneValid do
    def error(position) do
      unless position == 1 do
        "Invalid entry"
      end
    end
  end

  defmodule DisplayWithInputs do
    defstruct state: []

    defimpl Display do
      def output(_console, _message) do
      end

      def input(%DisplayWithInputs{state: state}, _message) do
        List.first(state)
      end
    end
  end

  test "with a valid entry returns the player's selection" do
    assert Player.selection(%HumanPlayer{
             token: "X",
             display: %DisplayWithInputs{state: ["1"]},
             parser: ParserWithOne,
             validator: ValidatorWithOneValid
           }) == 1
  end

  test "with an invalid entry prompts the user until a valid entry" do
    assert Player.selection(%HumanPlayer{
             token: "X",
             display: %DisplayWithInputs{state: ["0", "10", "1"]},
             parser: ParserWithOne,
             validator: ValidatorWithOneValid
           }) == 1
  end
end
