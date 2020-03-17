defmodule TicTacToe.HumanPlayer do
  alias TicTacToe.Player
  alias TicTacToe.Display
  alias TicTacToe.PositionValidator
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Parser

  defstruct token: ""

  defimpl Player do
    def selection(%HumanPlayer{token: token}, opts \\ []) do
      display = Keyword.get(opts, :display, Display)
      parser = Keyword.get(opts, :parser, Parser)
      validator = Keyword.get(opts, :validator, PositionValidator)
      state = Keyword.get(opts, :state, [])

      display.input(message(token), state: state)
      |> parser.to_integer()
      |> validate_input(
        %HumanPlayer{token: token},
        display,
        parser,
        validator,
        state
      )
    end

    defp message(token) do
      "Go #{token}. Please select your move[1, 9]."
    end

    defp validate_input(input, player, display, parser, validator, state) do
      unless error = validator.error(input) do
        input
      else
        error |> display.output()
        new_state = List.delete_at(state, 0)

        selection(player,
          display: display,
          parser: parser,
          validator: validator,
          state: new_state
        )
      end
    end
  end
end
