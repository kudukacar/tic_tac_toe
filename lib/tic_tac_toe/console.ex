defmodule TicTacToe.Console do
  alias TicTacToe.Display
  alias TicTacToe.Console

  defstruct input: [:input], outputs: [], puts: &IO.puts/1, gets: &IO.gets/1

  defimpl Display do
    def output(%Console{outputs: outputs, puts: puts} = display, message) do
      puts.(message)
      %{display | outputs: outputs ++ [message]}
    end

    def input(%Console{gets: gets} = display, message) do
      %{display | input: gets.(message <> "\n") |> String.trim()}
    end
  end
end
