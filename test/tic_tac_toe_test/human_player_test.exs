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
    def error(position, _board) do
      unless position == 1 do
        "Invalid entry"
      end
    end
  end

  defmodule DisplayWithInputs do
    defstruct [:input, :moves]

    defimpl Display do
      def output(_console, _message) do
      end

      def input(%DisplayWithInputs{moves: [input | moves]} = display, _message) do
        %{display | input: input, moves: moves}
      end
    end
  end

  test "with a valid entry returns the player's selection" do
    board = []

    assert Player.selection(
             %HumanPlayer{
               token: "X",
               display: %DisplayWithInputs{moves: ["1"]},
               parser: ParserWithOne,
               validator: ValidatorWithOneValid
             },
             board
           ).selection == 1
  end

  test "with an invalid entry prompts the user until a valid entry" do
    board = []

    assert Player.selection(
             %HumanPlayer{
               token: "X",
               display: %DisplayWithInputs{moves: ["0", "10", "1"]},
               parser: ParserWithOne,
               validator: ValidatorWithOneValid
             },
             board
           ).selection == 1
  end
end
