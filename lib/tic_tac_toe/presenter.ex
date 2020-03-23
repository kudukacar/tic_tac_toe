defmodule TicTacToe.Presenter do
  alias TicTacToe.BoardInspect

  def present(board) do
    space = " "

    """

     #{BoardInspect.get(board, 1) || space} | #{
      BoardInspect.get(board, 2) || space
    } | #{BoardInspect.get(board, 3) || space} 
    ---+---+---
     #{BoardInspect.get(board, 4) || space} | #{
      BoardInspect.get(board, 5) || space
    } | #{BoardInspect.get(board, 6) || space} 
    ---+---+---
     #{BoardInspect.get(board, 7) || space} | #{
      BoardInspect.get(board, 8) || space
    } | #{BoardInspect.get(board, 9) || space} 

    """
  end
end
