defmodule TicTacToe.Display do
  def output(message, opts \\ []) do
    puts = Keyword.get(opts, :puts, &IO.puts/1)
    messages = Keyword.get(opts, :messages, [])

    puts.(message)
    messages ++ [message]
  end

  def input(message, opts \\ []) do
    gets = Keyword.get(opts, :gets, &IO.gets/1)

    gets.(message <> "\n") |> String.trim()
  end
end
