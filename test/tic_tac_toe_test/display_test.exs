defmodule TicTacToe.DisplayTest do
  use ExUnit.Case
  alias TicTacToe.Display

  test "adds the printed message to the messages list" do
    assert Display.output("Welcome to Tic-Tac-Toe") == [
             "Welcome to Tic-Tac-Toe"
           ]
  end
end
