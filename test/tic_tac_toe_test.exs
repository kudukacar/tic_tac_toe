defmodule TicTacToeTest do
  use ExUnit.Case

  test "welcomes the user to Tic-Tac-Toe" do
    assert TicTacToe.run() == nil
  end
end
