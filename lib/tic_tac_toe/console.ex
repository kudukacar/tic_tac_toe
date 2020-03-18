defmodule TicTacToe.Console do
  alias TicTacToe.Display
  alias TicTacToe.Console

  defstruct state: [], puts: &IO.puts/1, gets: &IO.gets/1

  defimpl Display do
    def output(%Console{state: state, puts: puts}, message) do
      puts.(message)
      state ++ [message]
    end

    def input(%Console{gets: gets}, message) do
      gets.(message <> "\n") |> String.trim()
    end
  end
end
