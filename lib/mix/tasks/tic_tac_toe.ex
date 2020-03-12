defmodule Mix.Tasks.TicTacToe do
  use Mix.Task
  alias TicTacToe.Board
  alias TicTacToe.Display
  alias TicTacToe.Presenter

  def run(_) do
    TicTacToe.run(Board, Display, Presenter)
  end
end
