defmodule TicTacToe.HumanPlayer do
  alias TicTacToe.Player
  alias TicTacToe.Display
  alias TicTacToe.Console
  alias TicTacToe.PositionValidator
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Parser

  defstruct token: [:token],
            selection: [:selection],
            display: %Console{},
            parser: Parser,
            validator: PositionValidator

  defimpl Player do
    def selection(
          %HumanPlayer{
            token: token,
            display: display,
            parser: parser,
            validator: validator
          } = player,
          board
        ) do
      display = Display.input(display, message(token))
      input = parser.to_integer(display.input)

      unless error = validator.error(input, board) do
        %{player | selection: input, display: display}
      else
        Display.output(display, error)

        selection(%{player | display: display}, board)
      end
    end

    def get(%HumanPlayer{selection: selection, token: token}) do
      {selection, token}
    end

    defp message(token) do
      "Go #{token}. Please select your move[1, 9]."
    end
  end
end
