defmodule TicTacToe.HumanPlayerTest do
  use ExUnit.Case
  alias TicTacToe.Player
  alias TicTacToe.HumanPlayer

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
    def output(_message) do
    end

    def input(_message, opts) do
      state = Keyword.get(opts, :state, [])
      List.first(state)
    end
  end

  test "with a valid entry returns the player's selection" do
    assert Player.selection(%HumanPlayer{token: "X"},
             display: DisplayWithInputs,
             parser: ParserWithOne,
             validator: ValidatorWithOneValid,
             state: ["1"]
           ) == 1
  end

  test "with an invalid entry prompts the user until a valid entry" do
    assert Player.selection(%HumanPlayer{token: "X"},
             display: DisplayWithInputs,
             parser: ParserWithOne,
             validator: ValidatorWithOneValid,
             state: ["0", "10", "1"]
           ) == 1
  end
end
