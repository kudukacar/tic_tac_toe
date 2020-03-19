defmodule Mix.Tasks.TicTacToe do
  use Mix.Task
  alias TicTacToe.Console
  alias TicTacToe.Presenter
  alias TicTacToe.HumanPlayer

  def run(_) do
    TicTacToe.run(%{
      board: List.duplicate(nil, 9),
      display: %Console{},
      presenter: Presenter,
      players: [%HumanPlayer{token: "X"}, %HumanPlayer{token: "O"}]
    })
  end
end
