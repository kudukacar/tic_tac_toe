defmodule TicTacToe.PositionValidator do
  alias TicTacToe.PositionValidator
  
  defstruct position: 0

  defimpl TicTacToe.Validator do
    def error(%PositionValidator{position: position}) do
      range = 1..9
      unless Enum.member?(range, position) do
        "Invalid entry."
      end
    end
  end
end