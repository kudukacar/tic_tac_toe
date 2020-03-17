defmodule TicTacToe.Parser do
  def to_integer(input) do
    try do
      String.to_integer(input)
    rescue
      ArgumentError -> 0
    end
  end
end
