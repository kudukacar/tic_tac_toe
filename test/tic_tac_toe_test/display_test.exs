defmodule TicTacToe.DisplayTest do
  use ExUnit.Case
  alias TicTacToe.Display

  def fake_io(message) do
    message
  end

  test "prints a message" do
    callback = fn message ->
      send(self(), {:i_was_called_with, message})
    end

    Display.output("Welcome to Tic-Tac-Toe", puts: callback)

    assert_received({:i_was_called_with, "Welcome to Tic-Tac-Toe"})
  end

  test "return messages" do
    assert Display.output("Welcome to Tic-Tac-Toe", puts: &fake_io/1) == [
             "Welcome to Tic-Tac-Toe"
           ]
  end
end
