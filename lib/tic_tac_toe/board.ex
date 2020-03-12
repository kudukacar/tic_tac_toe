defmodule TicTacToe.Board do
  def empty_grid do
    List.duplicate(nil, 9)
  end

  def get(grid, position) do
    Enum.at(grid, position - 1)
  end
end
