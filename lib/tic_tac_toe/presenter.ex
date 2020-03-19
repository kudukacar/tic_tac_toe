defmodule TicTacToe.Presenter do
  alias TicTacToe.BoardInspect

  def present(board) do
    space = " "

    """

     #{BoardInspect.get(board, 1).position_value || space} | #{
      BoardInspect.get(board, 2).position_value || space
    } | #{BoardInspect.get(board, 3).position_value || space} 
    ---+---+---
     #{BoardInspect.get(board, 4).position_value || space} | #{
      BoardInspect.get(board, 5).position_value || space
    } | #{BoardInspect.get(board, 6).position_value || space} 
    ---+---+---
     #{BoardInspect.get(board, 7).position_value || space} | #{
      BoardInspect.get(board, 8).position_value || space
    } | #{BoardInspect.get(board, 9).position_value || space} 

    """
  end
end
