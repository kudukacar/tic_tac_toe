defmodule TicTacToeTest do
  use ExUnit.Case
  doctest TicTacToe

  test "welcomes the user to Tic-Tac-Toe" do
    assert TicTacToe.run() == nil
  end
end
