defmodule TicTacToe.ConsoleTest do
  use ExUnit.Case
  alias TicTacToe.Display
  alias TicTacToe.Console

  defmodule FakeIO do
    def puts(message) do
      message
    end

    def gets(message) do
      message |> String.trim()
    end
  end

  test "prints a message" do
    callback = fn message ->
      send(self(), {:i_was_called_with, message})
    end

    Display.output(%Console{puts: callback}, "Welcome to Tic-Tac-Toe")

    assert_received({:i_was_called_with, "Welcome to Tic-Tac-Toe"})
  end

  test "return messages" do
    assert Display.output(
             %Console{puts: &FakeIO.puts/1},
             "Welcome to Tic-Tac-Toe"
           ).outputs == [
             "Welcome to Tic-Tac-Toe"
           ]
  end

  test "gets the user's trimmed entry" do
    assert Display.input(
             %Console{gets: &FakeIO.gets/1},
             "Please enter a position\n"
           ).input ==
             "Please enter a position"
  end
end
