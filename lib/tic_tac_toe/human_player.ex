defmodule TicTacToe.HumanPlayer do
  alias TicTacToe.Player
  alias TicTacToe.Display
  alias TicTacToe.Console
  alias TicTacToe.PositionValidator
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Parser

  defstruct token: [:token],
            display: %Console{},
            parser: Parser,
            validator: PositionValidator

  defimpl Player do
    def selection(%HumanPlayer{
          token: token,
          display: display,
          parser: parser,
          validator: validator
        }) do
      input = Display.input(display, message(token)) |> parser.to_integer()

      unless error = validator.error(input) do
        input
      else
        Display.output(%{state: state} = display, error)

        selection(%HumanPlayer{
          token: token,
          display: %{display | state: List.delete_at(state, 0)},
          parser: parser,
          validator: validator
        })
      end
    end

    defp message(token) do
      "Go #{token}. Please select your move[1, 9]."
    end
  end
end
