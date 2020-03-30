defmodule Mix.Tasks.TicTacToe do
  use Mix.Task
  alias TicTacToe.Console
  alias TicTacToe.Presenter
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Board
  alias TicTacToe.ComputerPlayer

  def run(_) do
    TicTacToe.run(%{
      board: Board.new(9),
      display: %Console{},
      presenter: Presenter,
      players: [%HumanPlayer{token: "X"}, %ComputerPlayer{token: "O"}]
    })
  end
end
