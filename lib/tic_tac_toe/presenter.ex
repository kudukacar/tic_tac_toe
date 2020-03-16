defmodule TicTacToe.Presenter do
  alias TicTacToe.Board

  def present(board) do
    space = " "

    """

     #{Board.get(board, 1) || space} | #{Board.get(board, 2) || space} | #{
      Board.get(board, 3) || space
    } 
    ---+---+---
     #{Board.get(board, 4) || space} | #{Board.get(board, 5) || space} | #{
      Board.get(board, 6) || space
    } 
    ---+---+---
     #{Board.get(board, 7) || space} | #{Board.get(board, 8) || space} | #{
      Board.get(board, 9) || space
    } 

    """
  end
end
