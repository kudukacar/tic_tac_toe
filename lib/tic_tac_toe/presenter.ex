defmodule TicTacToe.Presenter do
  def present(grid, board) do
    space = " "

    """

     #{board.get(grid, 1) || space} | #{board.get(grid, 2) || space} | #{
      board.get(grid, 3) || space
    } 
    ---+---+---
     #{board.get(grid, 4) || space} | #{board.get(grid, 5) || space} | #{
      board.get(grid, 6) || space
    } 
    ---+---+---
     #{board.get(grid, 7) || space} | #{board.get(grid, 8) || space} | #{
      board.get(grid, 9) || space
    } 

    """
  end
end
