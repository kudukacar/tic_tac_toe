defmodule TicTacToe do
  def run(board, display, presenter) do
    grid = board.empty_grid
    show_grid(grid, board, display, presenter)
  end

  def show_grid(grid, board, display, presenter) do
    display.output(presenter.present(grid, board))
  end
end
