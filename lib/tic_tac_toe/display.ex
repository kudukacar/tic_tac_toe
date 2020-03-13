defmodule TicTacToe.Display do
  def output(message, messages \\ []) do
    IO.puts(message)
    [message | messages]
  end
end
