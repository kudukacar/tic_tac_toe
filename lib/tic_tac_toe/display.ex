defmodule TicTacToe.Display do
  def output(message, opts \\ []) do
    puts = Keyword.get(opts, :puts, &IO.puts/1)
    messages = Keyword.get(opts, :messages, [])

    puts.(message)
    [message | messages]
  end
end
