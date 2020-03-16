defmodule TicTacToe do
  alias TicTacToe.Display
  alias TicTacToe.Presenter

  def run(opts \\ []) do
    board = Keyword.get(opts, :board, List.duplicate(nil, 9))
    display = Keyword.get(opts, :display, Display)
    presenter = Keyword.get(opts, :presenter, Presenter)

    board |> presenter.present() |> display.output()
  end
end
